import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

class HospitalDoctorClinicViewModel extends ChangeNotifier
{
  List<HospitalDoctorClinic> hospitalDoctorClinicList=[];

  fetchHospitalDoctorClinic(  dropdownCitySelected,  dropdownDiseaseSelected) async
  {
    hospitalDoctorClinicList =await GplusApi().fetchDataSearch(
        dropdownCitySelected,
        dropdownDiseaseSelected);
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