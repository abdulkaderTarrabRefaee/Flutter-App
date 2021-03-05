
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view_models/list_of_disease_view_model.dart';
import 'package:gpluseclinicapp/view_models/list_of_hos_dr_cl.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  City  dropdownCitySelected ;
  Disease dropdownDiseaseSelected;
  List<HospitalDoctorClinic> hospitalDoctorClinic;


  @override
  void initState() {
    super.initState();
    Provider.of<CityListViewModel>(context, listen: false)
        .fetchCity();
    Provider.of<DiseaseListViewModel>(context, listen: false)
        .fetchDisease();
    Provider.of<HospitalDoctorClinicViewModel>(context, listen: false)
        .fetchHospitalDoctorClinic();
  }

  Widget _buildList(CityListViewModel vs) {
   return Center(
     child: Text(vs.citiesList.length.toString()),
   );
  }
  @override
  Widget build(BuildContext context) {
    var cityProvider = Provider.of<CityListViewModel>(context);
    var diseaseProvider = Provider.of<DiseaseListViewModel>(context);
    var hospitalDoctorClinic= Provider.of<HospitalDoctorClinicViewModel>(context);
    return Scaffold(
      appBar: AppBar(
       title:  _buildList(cityProvider),
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
            hint: Text("Select City"),
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
          Center(
            child: MyButton(dropdownCitySelected,dropdownDiseaseSelected,hospitalDoctorClinic.hospitalDoctorClinicList),
          ),

        ],
      ),

    ),
    )
    ),
    );
  }
}
void Search(City dropdownCitySelected ,Disease dropdownDiseaseSelected)
{
  return print("" + dropdownCitySelected.name +  dropdownDiseaseSelected.name);
}


class MyButton extends StatelessWidget {
  City dropdownCitySelected;
  Disease dropdownDiseaseSelected;
  List<HospitalDoctorClinic> hospitalDoctorClinic;


  MyButton(this.dropdownCitySelected, this.dropdownDiseaseSelected,this.hospitalDoctorClinic);

  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The city is :"+ dropdownCitySelected.name +" and The Disease is :" + dropdownDiseaseSelected.name+ " Doktor is: "+ hospitalDoctorClinic.first.name ),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}