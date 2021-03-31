import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/detalis_ho_dr_cl.dart';
import 'package:gpluseclinicapp/view_models/list_of_hos_dr_cl.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

String urlImage = "https://gplusclinic.com/images/upload/";

// ignore: must_be_immutable

class SearchView extends StatefulWidget {
  City dropdownCitySelected;
  Disease dropdownDiseaseSelected;
  List<bool> typeSelected;
  SearchView(this.dropdownCitySelected, this.dropdownDiseaseSelected,
      this.typeSelected,
      {Key key})
      : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<HospitalDoctorClinic> hospitalDoctorClinics;
  List<bool> pageSelected;
  int pageNamber = 1;
  //max-3 get yarin
  int maxNumberPage = 7;

  void incPage() {
    if (pageSelected[0] == true && pageNamber > 1) {
      pageNamber--;
    }
    if (pageSelected[4] == true && pageNamber < maxNumberPage) {
      pageNamber++;
    }

  }

  @override
  void initState() {
    Provider.of<HospitalDoctorClinicViewModel>(context, listen: false)
        .fetchHospitalDoctorClinic(widget.dropdownCitySelected,
            widget.dropdownDiseaseSelected, widget.typeSelected, pageNamber);
  }

  @override
  Widget build(BuildContext context) {
    var hospitalDoctorClinic =
        Provider.of<HospitalDoctorClinicViewModel>(context);
    pageSelected = [false, false, false, false, false];
    return Scaffold(
      appBar: AppBar(title: Text("Search Result")),
      body: Stack(
        children: [
          Center(
            child: SafeArea(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount:
                      hospitalDoctorClinic.hospitalDoctorClinicList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cardItem(
                        context,
                        hospitalDoctorClinic.hospitalDoctorClinicList[index],
                        widget.typeSelected);
                  }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FutureBuilder<Content>(
                future: GplusApi().fetchContentData(widget.dropdownCitySelected,
                    widget.dropdownDiseaseSelected, widget.typeSelected, pageNamber),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    maxNumberPage = snapshot.data.totalPage;
                    print("sds" + maxNumberPage.toString());
                    return Container(
                      color: Colors.white,
                      child: ToggleButtons(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Back',
                              ),
                            ),
                          ),
                          // first toggle button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (pageNamber + 1).toString(),
                            ),
                          ),
                          // second toggle button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (pageNamber + 2).toString(),
                            ),
                          ),
                          // third toggle button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (pageNamber + 3).toString(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Next',
                            ),
                          ),
                        ],
                        // logic for button selection below
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < pageSelected.length; i++) {
                              pageSelected[i] = i == index;
                            }
                            incPage();
                            initState();
                            print(pageSelected);
                          });
                        },
                        isSelected: pageSelected,
                      ),
                    );
                  } else
                    return SafeArea(
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                }),
          ),
        ],
      ),
    );
  }
}

Widget cardItem(BuildContext context, HospitalDoctorClinic hospitalDoctorClinic,
    List<bool> typeSelected) {
  return SingleChildScrollView(
      child: Column(
    children: [
      InkWell(
        child: Container(
          height: 250,
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                child: Container(
                  width: 100,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(urlImage + hospitalDoctorClinic.image),
                  ),
                ),
              ),
              Column(
                children: [
                  new Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.black,
                  ),
                  Container(
                    width: 200,
                    height: 20,
                    alignment: Alignment.topLeft,
                    child: Text(
                      hospitalDoctorClinic.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(hospitalDoctorClinic.summary == null
                        ? ""
                        : hospitalDoctorClinic.summary),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          print(hospitalDoctorClinic.name);
          _showResultSearch(context, hospitalDoctorClinic, typeSelected);
        },
      ),
      Container(
        height: 10,
        padding: EdgeInsets.only(bottom: 0),
        child: Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.black12,
        ),
      ),
    ],
  )
      // child: Center(child: Text(hospitalDoctorClinic.name)),
      );
}

void _showResultSearch(BuildContext context,
    HospitalDoctorClinic hospitalDoctorClinics, typeSelected) {
  print(typeSelected);
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return new DetailedProfile(hospitalDoctorClinics, typeSelected);
  }));
}
