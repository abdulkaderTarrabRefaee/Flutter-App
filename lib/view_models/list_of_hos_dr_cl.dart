import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
class HospitalDoctorClinicViewModel extends ChangeNotifier
{
  List<HospitalDoctorClinic> _hospitalDoctorClinicList=[];

  fetchHospitalDoctorClinic(  dropdownCitySelected,  dropdownDiseaseSelected) async
  {
    _hospitalDoctorClinicList =await GplusApi().fetchDataSearch(
        dropdownCitySelected,
        dropdownDiseaseSelected);
    notifyListeners();
  }
  List<HospitalDoctorClinic> get hospitalDoctorClinicList => _hospitalDoctorClinicList;
}