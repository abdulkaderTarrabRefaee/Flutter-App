import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
class HospitalDoctorClinicViewModel extends ChangeNotifier
{
  List<HospitalDoctorClinic> _hospitalDoctorClinicList=[];
  fetchHospitalDoctorClinic() async
  {
    _hospitalDoctorClinicList =await GplusApi().fetchDataSearch();
    notifyListeners();
  }
  List<HospitalDoctorClinic> get hospitalDoctorClinicList => _hospitalDoctorClinicList;
}