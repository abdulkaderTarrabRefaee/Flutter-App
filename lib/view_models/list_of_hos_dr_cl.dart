import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

class HospitalDoctorClinicViewModel extends ChangeNotifier {
  List<HospitalDoctorClinic> hospitalDoctorClinicList = [];
  List<bool> typeSelected;
  fetchHospitalDoctorClinic(
      dropdownCitySelected, dropdownDiseaseSelected, typeSelected, int pageNamber) async {
    hospitalDoctorClinicList = await GplusApi().fetchDataSearch(
        dropdownCitySelected, dropdownDiseaseSelected, typeSelected,pageNamber);
    notifyListeners();
  }
}

class ExpertisesViewModel extends ChangeNotifier {
  List<ExpertisesData> expertisesList = [];

  fetchExpertises() async {
    expertisesList = await GplusApi().fetchDataSearchExpertises();
    notifyListeners();
  }
}
