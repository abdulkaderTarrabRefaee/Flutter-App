// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));

String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  Staff({
    this.isSuccess,
    this.message,
    this.data,
    this.staffData,
    this.totalRows,
    this.pageNumber,
    this.rowsCount,
    this.totalPage,
  });

  bool isSuccess;
  String message;
  dynamic data;
  List<StaffData> staffData;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    staffData: List<StaffData>.from(json["datas"].map((x) => StaffData.fromJson(x))),
    totalRows: json["total_rows"],
    pageNumber: json["page_number"],
    rowsCount: json["rows_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": message,
    "data": data,
    "datas": List<dynamic>.from(staffData.map((x) => x.toJson())),
    "total_rows": totalRows,
    "page_number": pageNumber,
    "rows_count": rowsCount,
    "total_page": totalPage,
  };
}

class StaffData {
  StaffData({
    this.parentId,
    this.title,
    this.name,
    this.jobTitle,
    this.specialisations,
    this.languages,
    this.content,
    this.image,
    this.units,
    this.summary,
    this.link,
    this.rate,
    this.rateCount,
    this.isAward,
    this.isFreeConsultation,
  });

  int parentId;
  String title;
  String name;
  dynamic jobTitle;
  List<String> specialisations;
  List<String> languages;
  String content;
  String image;
  List<String> units;
  String summary;
  String link;
  int rate;
  int rateCount;
  bool isAward;
  bool isFreeConsultation;

  factory StaffData.fromJson(Map<String, dynamic> json) => StaffData(
    parentId: json["parent_id"],
    title: json["title"],
    name: json["name"],
    jobTitle: json["job_title"],
    specialisations: List<String>.from(json["specialisations"].map((x) => x)),
    languages: List<String>.from(json["languages"].map((x) => x)),
    content: json["content"],
    image: json["image"],
    units: List<String>.from(json["units"].map((x) => x)),
    summary: json["summary"],
    link: json["link"],
    rate: json["rate"],
    rateCount: json["rate_count"],
    isAward: json["is_award"],
    isFreeConsultation: json["is_free_consultation"],
  );

  Map<String, dynamic> toJson() => {
    "parent_id": parentId,
    "title": title,
    "name": name,
    "job_title": jobTitle,
    "specialisations": List<dynamic>.from(specialisations.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "content": content,
    "image": image,
    "units": List<dynamic>.from(units.map((x) => x)),
    "summary": summary,
    "link": link,
    "rate": rate,
    "rate_count": rateCount,
    "is_award": isAward,
    "is_free_consultation": isFreeConsultation,
  };
}
