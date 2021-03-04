import 'package:gpluseclinicapp/model/city/city.dart';

class DataGplusList {
  final List<dynamic> dataGpList;
  DataGplusList({this.dataGpList});
  factory DataGplusList.fromJson(Map<String, dynamic> jsonData) {
    return DataGplusList(
      dataGpList: jsonData['content']['datas'],
    );
  }
}