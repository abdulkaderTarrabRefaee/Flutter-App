
class DiseaseList {
  final List<dynamic> disease;
  DiseaseList({this.disease});
  factory DiseaseList.fromJson(Map<String, dynamic> jsonData) {
    return DiseaseList(
      disease: jsonData['allUnits']['datas'],
    );
  }
}