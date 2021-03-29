import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

class HospitalDoctorClinicViewModel extends ChangeNotifier
{
  List<HospitalDoctorClinic> hospitalDoctorClinicList=[];
  List<bool> typeSelected ;
  fetchHospitalDoctorClinic(  dropdownCitySelected,  dropdownDiseaseSelected,typeSelected) async
  {
    hospitalDoctorClinicList =await GplusApi().fetchDataSearch(
        dropdownCitySelected,
        dropdownDiseaseSelected,typeSelected);
    notifyListeners();
  }




  }

  class CityHospitalDoctorClinicViewModel extends ChangeNotifier
{
  List<CitiesData> hospitalDoctorClinicList=[];

  fetchHospitalDoctorClinic( ) async
  {
    hospitalDoctorClinicList =await GplusApi().fetchDataSearchCity();
    notifyListeners();
  }
}