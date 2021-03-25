

class HospitalDoctorClinicList {
  final List<dynamic> hospitalDoctorClinicList;
  HospitalDoctorClinicList({this.hospitalDoctorClinicList});
  factory HospitalDoctorClinicList.fromJson(Map<String, dynamic> jsonData) {
    return HospitalDoctorClinicList(
      hospitalDoctorClinicList: jsonData['content']['datas'],
    );
  }
}



class CityHospitalDoctorClinicList {
  final List<dynamic> cityHospitalDoctorClinicList;
  CityHospitalDoctorClinicList({this.cityHospitalDoctorClinicList});
  factory CityHospitalDoctorClinicList.fromJson(Map<String, dynamic> jsonData) {
    return CityHospitalDoctorClinicList(
      cityHospitalDoctorClinicList: jsonData['cities']['datas'],
    );
  }
}


