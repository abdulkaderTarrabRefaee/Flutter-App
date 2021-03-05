

class HospitalDoctorClinicList {
  final List<dynamic> hospitalDoctorClinicList;
  HospitalDoctorClinicList({this.hospitalDoctorClinicList});
  factory HospitalDoctorClinicList.fromJson(Map<String, dynamic> jsonData) {
    return HospitalDoctorClinicList(
      hospitalDoctorClinicList: jsonData['content']['datas'],
    );
  }
}


