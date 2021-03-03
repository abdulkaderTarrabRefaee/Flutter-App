import 'file:///C:/Users/User/AndroidStudioProjects/gpluseclinicapp/lib/model/city/city.dart';
import 'dart:convert';
class CitesList {
  final List<dynamic> cities;
  CitesList({this.cities});
  factory CitesList.fromJson(Map<String, dynamic> jsonData) {
    return CitesList(
      cities: jsonData['cities'],
    );
  }
}

// To parse this JSON data, do
//
//     final gplusclinic = gplusclinicFromJson(jsonString);


// To parse this JSON data, do
//
//     final homepage = homepageFromJson(jsonString);



Homepage homepageFromJson(String str) => Homepage.fromJson(json.decode(str));

String homepageToJson(Homepage data) => json.encode(data.toJson());

class Homepage {
  Homepage({
    this.allUnits,
    this.cities,
  });

  AllUnits allUnits;
  Cities cities;

  factory Homepage.fromJson(Map<String, dynamic> json) => Homepage(
    allUnits: AllUnits.fromJson(json["allUnits"]),
    cities: Cities.fromJson(json["cities"]),
  );

  Map<String, dynamic> toJson() => {
    "allUnits": allUnits.toJson(),
    "cities": cities.toJson(),
  };
}

class AllUnits {
  AllUnits({
    this.isSuccess,
    this.message,
    this.data,
    this.datas,
    this.totalRows,
    this.pageNumber,
    this.rowsCount,
    this.totalPage,
  });

  bool isSuccess;
  String message;
  dynamic data;
  List<AllUnitsData> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory AllUnits.fromJson(Map<String, dynamic> json) => AllUnits(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    datas: List<AllUnitsData>.from(json["datas"].map((x) => AllUnitsData.fromJson(x))),
    totalRows: json["total_rows"],
    pageNumber: json["page_number"],
    rowsCount: json["rows_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": message,
    "data": data,
    "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
    "total_rows": totalRows,
    "page_number": pageNumber,
    "rows_count": rowsCount,
    "total_page": totalPage,
  };
}

class AllUnitsData {


  int id;
  String name;
  bool active;
  String metaTitle;
  String metaDescription;
  int languageId;
  String groupId;
  int doctorId;

  AllUnitsData({this.id, this.name, this.active, this.metaTitle,
      this.metaDescription, this.languageId, this.groupId, this.doctorId});

  factory AllUnitsData.fromJson(Map<String, dynamic> json) => AllUnitsData(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaDescription: json["meta_description"] == null ? null : json["meta_description"],
    languageId: json["language_id"],
    groupId: json["group_id"],
    doctorId: json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active": active,
    "meta_title": metaTitle == null ? null : metaTitle,
    "meta_description": metaDescription == null ? null : metaDescription,
    "language_id": languageId,
    "group_id": groupId,
    "doctor_id": doctorId,
  };
}

class Cities {
  Cities({
    this.isSuccess,
    this.message,
    this.data,
    this.datas,
    this.totalRows,
    this.pageNumber,
    this.rowsCount,
    this.totalPage,
  });

  bool isSuccess;
  String message;
  dynamic data;
  List<CitiesData> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    datas: List<CitiesData>.from(json["datas"].map((x) => CitiesData.fromJson(x))),
    totalRows: json["total_rows"],
    pageNumber: json["page_number"],
    rowsCount: json["rows_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": message,
    "data": data,
    "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
    "total_rows": totalRows,
    "page_number": pageNumber,
    "rows_count": rowsCount,
    "total_page": totalPage,
  };
}

class CitiesData {
  CitiesData({
    this.id,
    this.name,
    this.languageId,
    this.groupId,
  });

  int id;
  String name;
  int languageId;
  String groupId;

  factory CitiesData.fromJson(Map<String, dynamic> json) => CitiesData(
    id: json["id"],
    name: json["name"],
    languageId: json["language_id"],
    groupId: json["group_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "language_id": languageId,
    "group_id": groupId,
  };
}
