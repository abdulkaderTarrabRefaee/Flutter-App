import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/view/search_view.dart';
import 'package:gpluseclinicapp/view_models/list_of_disease_view_model.dart';
import 'package:gpluseclinicapp/view_models/list_of_hos_dr_cl.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {


  City  dropdownCitySelected ;
  Disease dropdownDiseaseSelected;
  List<HospitalDoctorClinic> hospitalDoctorClinics;
  bool _isVisibleCircularProgress=false;


  void showToast(_isVisibleCircularProgress)
  {
    setState(() {
      this._isVisibleCircularProgress = _isVisibleCircularProgress;
    });
  }


  @override
  void initState() {
    Provider.of<CityListViewModel>(context, listen: false)
        .fetchCity();
    Provider.of<DiseaseListViewModel>(context, listen: false)
        .fetchDisease();
    Provider.of<HospitalDoctorClinicViewModel>(context, listen: false);
    Provider.of<CityHospitalDoctorClinicViewModel>(context,listen: false)
        .fetchHospitalDoctorClinic();
  }


  @override
  Widget build(BuildContext context) {
    var cityProvider = Provider.of<CityListViewModel>(context);
    var diseaseProvider = Provider.of<DiseaseListViewModel>(context);
    var hospitalDoctorClinic= Provider.of<HospitalDoctorClinicViewModel>(context);
    void clearData()
    {

     hospitalDoctorClinic.hospitalDoctorClinicList.clear();
     print("size" + hospitalDoctorClinic.hospitalDoctorClinicList.length.toString());
     print("data clear");

    }
    return Scaffold(
      appBar: AppBar(
        title:  Text("GplusClinc"),
      ),
      body: SafeArea(
          child: Center(
            child:  Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children:<Widget> [

                  SearchableDropdown<City>(

                    searchHint: "Select one",
                    isExpanded: true,
                    hint: Text("Select City"),
                    value: dropdownCitySelected,
                    items: cityProvider.citiesList.map((City ct){
                      return DropdownMenuItem<City>(
                          value: ct,
                          child: Text(ct.name));
                    }).toList(),

                    onChanged:(City ct )
                    {
                      setState(() {
                        dropdownCitySelected = ct;
                      });
                    },
                  ),
                  SearchableDropdown<Disease>(

                    isExpanded: true,
                    hint: Text("Select Disease"),
                    value: dropdownDiseaseSelected,
                    items: diseaseProvider.diseaseList.map((Disease cd){
                      return DropdownMenuItem<Disease>(
                          value: cd,
                          child: Text(cd.name));
                    }).toList(),
                    onChanged:(Disease cd )
                    {
                      setState(() {
                        dropdownDiseaseSelected = cd;
                      });
                    },
                  ),
                InkWell(
                  // When the user taps the button, show a snackbar.
                  onTap: () {

                      _showResultSearch(context,dropdownCitySelected,dropdownDiseaseSelected);


                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Flat Button'),
                  ),
                )


                ],
              ),

            ),

          )
      ),
    );
  }
}


void _showResultSearch(BuildContext context, dropdownCitySelected,dropdownDiseaseSelected) {
  Navigator.push(context, MaterialPageRoute(builder: (_)
  {
    return SearchView(dropdownCitySelected,dropdownDiseaseSelected);
  }));
}