import 'package:gpluseclinicapp/model/city/city.dart';

class CityList {
  final List<dynamic> cities;
  CityList({this.cities});
  factory CityList.fromJson(Map<String, dynamic> jsonData) {
    return CityList(
      cities: jsonData['cities']['datas'],
    );
  }
}