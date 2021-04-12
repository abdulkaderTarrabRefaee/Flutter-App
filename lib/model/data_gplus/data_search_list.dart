

class HospitalDoctorClinicList {
  final List<dynamic> hospitalDoctorClinicList;
  HospitalDoctorClinicList({this.hospitalDoctorClinicList});
  factory HospitalDoctorClinicList.fromJson(Map<String, dynamic> jsonData) {
    return HospitalDoctorClinicList(
      hospitalDoctorClinicList: jsonData['content']['datas'],
    );
  }
}



class ExpertisesList {
  final List<dynamic> expertisesList;
  ExpertisesList({this.expertisesList});
  factory ExpertisesList.fromJson(Map<String, dynamic> jsonData) {
    return ExpertisesList(
      expertisesList: jsonData['expertises']['datas'],
    );
  }
}


