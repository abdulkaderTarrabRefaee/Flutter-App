import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/detalis_dr.dart';
import 'package:gpluseclinicapp/view/detalis_hos.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  int pageNumberInc = 1;
  int pageCurrentNumber;
  //max-3 get yarin
  int maxNumberPage;
  int maxNumberResult;

  void incPage() {
    if (pageSelected[0] == true && pageNumberInc > 1) {
      pageNumberInc--;
    }
    if (pageSelected[1] == true && pageNumberInc < maxNumberPage) {
      pageNumberInc++;
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    pageSelected = [false, false];
    return FutureBuilder<HospitalDoctorClinicInfo>(
        future: GplusApi().fetchContentData(widget.dropdownCitySelected,
            widget.dropdownDiseaseSelected, widget.typeSelected, pageNumberInc),
        builder: (context, snapshot) {
          print("pageCurrentNumber : " + pageCurrentNumber.toString());
          if (snapshot.hasData) {
            maxNumberPage = snapshot.data.totalPage;
            pageCurrentNumber = snapshot.data.pageNumber;
            initState();
            return Scaffold(
                appBar: AppBar(
                    title: Text("Search Result" +
                        pageCurrentNumber.toString() +
                        "of " +
                        maxNumberPage.toString())),
                body: Stack(

                  children: [
                    SafeArea(
                      child: Container(
                        color: Colors.white70,
                        child: Column(
                          children: [
                            Text("data"),
                            Expanded(

                              child: ListView.builder(
                                  padding: const EdgeInsets.all(10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.datas.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return cardItem(
                                        context,
                                        snapshot.data.datas.toList()[index],
                                        widget.typeSelected);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.bottomCenter,

                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height)*0.93,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ToggleButtons(

                             selectedColor: Colors.red,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0),
                                  child: Text(
                                    'Back',
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0),
                                  child: Text(
                                    'Next',
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0; i < pageSelected.length; i++) {
                                    pageSelected[i] = i == index;
                                  }
                                  incPage();
                                  initState();
                                  print("the current page " +
                                      pageSelected.toString());
                                  print("MaxNumberPage " +
                                      maxNumberPage.toString());
                                });
                              },
                              isSelected: pageSelected,
                            ),
                          ),
                        )),
                  ],
                ));
          } else
            return SafeArea(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(backgroundColor: Colors.red),
                ),
              ),
            );
        });
  }
}

Widget cardItem(BuildContext context, HospitalDoctorClinic hospitalDoctorClinic,
    List<bool> typeSelected) {
  return  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        hoverColor:Colors.red,
        child: Container(
          height: 250,
          margin: EdgeInsets.only(top: 30),
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
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 140,
                          margin: EdgeInsets.only(left: 15, right: 15,),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _getImage(
                                urlImage + hospitalDoctorClinic.image),
                          ),
                        ),
                        if (hospitalDoctorClinic.isFreeConsultation)
                          Transform.translate(
                            offset: Offset(-20, -23.0),
                            child: Container(
                              width: 100,
                              height: 14,
                              color: Color.fromRGBO(75, 182, 255, 0.6),
                              child: Center(
                                child: Text(
                                  "FREE CONSULTATION",
                                  style: TextStyle(fontSize: 8),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                    if (hospitalDoctorClinic.isAward)
                      Transform.rotate(
                        angle: -22/7 / 6,
                        child: Container(
                         width: 60,
                          child: Image.network(
                              "https://gplusclinic.com/assets/img/avard-mini.png"),
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  new Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.black,
                  ),
                  Container(
                    width: 190,
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
                  Row(
                    children: [
                      Text(hospitalDoctorClinic.rate.toString(),
                          style: TextStyle(fontSize: 7)),
                      Container(

                        child: RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: hospitalDoctorClinic.rate.toDouble(),
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 10,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("from "+hospitalDoctorClinic.rateCount.toString()+ "  verified reviews ",style: TextStyle(fontSize: 6)),
                  if (hospitalDoctorClinic.showAddress)
                    Container(
                      width: 180,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        hospitalDoctorClinic.address == null
                            ? ""
                            : hospitalDoctorClinic.address,
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  Container(
                    width: 180,
                    height: 100,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                        hospitalDoctorClinic.summary == null
                            ? ""
                            : hospitalDoctorClinic.summary,
                        style: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          print(hospitalDoctorClinic.name);
          print(typeSelected);
          if(hospitalDoctorClinic.type==1)
          _showResultSearchDoc(context, hospitalDoctorClinic, typeSelected);
          if(hospitalDoctorClinic.type==2||hospitalDoctorClinic.type==3)
            _showResultSearchHos(context, hospitalDoctorClinic, typeSelected);

        },


      ),
      Container(
        height: 100,
        width: 10,
        padding: EdgeInsets.only(bottom: 10,top: 10,left: 10,right: 10),
      ),
    ],

      // child: Center(child: Text(hospitalDoctorClinic.name)),
      );
}

void _showResultSearchDoc(BuildContext context,
    HospitalDoctorClinic hospitalDoctorClinics, typeSelected) {
  print(typeSelected);
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return new DetailedProfileDoc(hospitalDoctorClinics, typeSelected);
  }));


}
void _showResultSearchHos(BuildContext context,
    HospitalDoctorClinic hospitalDoctorClinics, typeSelected) {
  print(typeSelected);
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return new DetailedProfileHos(hospitalDoctorClinics, typeSelected);

  }));
}
Widget _getImage(url ) {
  final imageProvider = ResizeImage.resizeIfNeeded(
    200,
    250,
    CachedNetworkImageProvider(
      url,
    ),
  );

  final image = Image(
    image: imageProvider,
  );



  return image;
}

