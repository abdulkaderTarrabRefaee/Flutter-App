// To parse this JSON data, do
//
//     final dataGplus = dataGplusFromJson(jsonString);

import 'dart:convert';

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
  ProfileData data;
  List<FluffyData> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        isSuccess: json["is_success"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
        datas: json["datas"] == null
            ? null
            : List<FluffyData>.from(
                json["datas"].map((x) => FluffyData.fromJson(x))),
        totalRows: json["total_rows"],
        pageNumber: json["page_number"],
        rowsCount: json["rows_count"],
        totalPage: json["total_page"],
      );

  Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
        "message": message,
        "data": data == null ? null : data.toJson(),
        "datas": datas == null
            ? null
            : List<dynamic>.from(datas.map((x) => x.toJson())),
        "total_rows": totalRows,
        "page_number": pageNumber,
        "rows_count": rowsCount,
        "total_page": totalPage,
      };
}

class ProfileData {
  ProfileData({
    this.parentId,
    this.name,
    this.address1,
    this.address2,
    this.countryId,
    this.city,
    this.cityName,
    this.state,
    this.stateName,
    this.postCode,
    this.location,
    this.phone,
    this.phone2,
    this.currencyId,
    this.unitName,
    this.type,
    this.title,
    this.genus,
    this.content,
    this.image,
    this.link,
    this.metaTitle,
    this.metaDescription,
    this.canonicalLink,
    this.languageId,
    this.paymentValue,
    this.rateAverage,
    this.summary,
    this.languages,
    this.expertise,
    this.units,
    this.statusId,
    this.titleId,
    this.clinicId,
    this.hospitalId,
    this.unitId,
    this.jobTitleId,
    this.genusId,
    this.paymentMethods,
    this.insurances,
    this.showAddress,
    this.address,
    this.isAward,
    this.isFreeConsultation,
  });

  int parentId;
  String name;
  String address1;
  String address2;
  int countryId;
  dynamic city;
  dynamic cityName;
  dynamic state;
  dynamic stateName;
  dynamic postCode;
  dynamic location;
  String phone;
  dynamic phone2;
  dynamic currencyId;
  dynamic unitName;
  int type;
  dynamic title;
  dynamic genus;
  String content;
  String image;
  String link;
  dynamic metaTitle;
  dynamic metaDescription;
  String canonicalLink;
  int languageId;
  dynamic paymentValue;
  int rateAverage;
  String summary;
  List<String> languages = [];
  List<String> expertise = [];
  List<String> units;
  int statusId;
  String titleId;
  int clinicId;
  int hospitalId;
  dynamic unitId;
  dynamic jobTitleId;
  String genusId;
  List<Insurance> paymentMethods;
  List<Insurance> insurances;
  bool showAddress;
  String address;
  bool isAward;
  bool isFreeConsultation;

  factory ProfileData.fromJson(Map<dynamic, dynamic> json) => ProfileData(
        parentId: json["parent_id"],
        name: json["name"],
        address1: json["address1"],
        address2: json["address2"],
        countryId: json["country_id"],
        city: json["city"],
        cityName: json["city_name"],
        state: json["state"],
        stateName: json["state_name"],
        postCode: json["post_code"],
        location: json["location"],
        phone: json["phone"],
        phone2: json["phone2"],
        currencyId: json["currency_id"],
        unitName: json["unit_name"],
        type: json["type"],
        title: json["title"],
        genus: json["genus"],
        content: json["content"],
        image: json["image"],
        link: json["link"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        canonicalLink: json["canonical_link"],
        languageId: json["language_id"],
        paymentValue: json["payment_value"],
        rateAverage: json["rate_average"],
        summary: json["summary"],
        languages: List<String>.from(
            json["languages"] != null ? json["languages"].map((x) => x) : []),
        expertise: List<String>.from(
            json["expertise"] != null ? json["expertise"].map((x) => x) : []),
        units: List<String>.from(json["units"].map((x) => x)),
        statusId: json["status_id"],
        titleId: json["title_id"],
        clinicId: json["clinic_id"],
        hospitalId: json["hospital_id"],
        unitId: json["unit_id"],
        jobTitleId: json["job_title_id"],
        genusId: json["genus_id"],
        paymentMethods: List<Insurance>.from(
            json["paymentMethods"].map((x) => Insurance.fromJson(x))),
        insurances: List<Insurance>.from(
            json["insurances"].map((x) => Insurance.fromJson(x))),
        showAddress: json["show_address"],
        address: json["address"],
        isAward: json["is_award"],
        isFreeConsultation: json["is_free_consultation"],
      );

  Map<String, dynamic> toJson() => {
        "parent_id": parentId,
        "name": name,
        "address1": address1,
        "address2": address2,
        "country_id": countryId,
        "city": city,
        "city_name": cityName,
        "state": state,
        "state_name": stateName,
        "post_code": postCode,
        "location": location,
        "phone": phone,
        "phone2": phone2,
        "currency_id": currencyId,
        "unit_name": unitName,
        "type": type,
        "title": title,
        "genus": genus,
        "content": content,
        "image": image,
        "link": link,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "canonical_link": canonicalLink,
        "language_id": languageId,
        "payment_value": paymentValue,
        "rate_average": rateAverage,
        "summary": summary,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "expertise": List<dynamic>.from(expertise.map((x) => x)),
        "units": List<dynamic>.from(units.map((x) => x)),
        "status_id": statusId,
        "title_id": titleId,
        "clinic_id": clinicId,
        "hospital_id": hospitalId,
        "unit_id": unitId,
        "job_title_id": jobTitleId,
        "genus_id": genusId,
        "paymentMethods":
            List<dynamic>.from(paymentMethods.map((x) => x.toJson())),
        "insurances": List<dynamic>.from(insurances.map((x) => x.toJson())),
        "show_address": showAddress,
        "address": address,
        "is_award": isAward,
        "is_free_consultation": isFreeConsultation,
      };
}

class Insurance {
  Insurance({
    this.id,
    this.name,
    this.languageId,
    this.groupId,
    this.isThere,
  });

  int id;
  String name;
  int languageId;
  String groupId;
  int isThere;

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
        id: json["id"],
        name: json["name"],
        languageId: json["language_id"],
        groupId: json["group_id"],
        isThere: json["isThere"] == null ? null : json["isThere"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "language_id": languageId,
        "group_id": groupId,
        "isThere": isThere == null ? null : isThere,
      };
}

class FluffyData {
  FluffyData({
    this.id,
    this.name,
    this.languageId,
    this.groupId,
    this.active,
    this.metaTitle,
    this.metaDescription,
    this.doctorId,
  });

  int id;
  String name;
  int languageId;
  String groupId;
  bool active;
  String metaTitle;
  dynamic metaDescription;
  int doctorId;

  factory FluffyData.fromJson(Map<String, dynamic> json) => FluffyData(
        id: json["id"],
        name: json["name"],
        languageId: json["language_id"],
        groupId: json["group_id"],
        active: json["active"] == null ? null : json["active"],
        metaTitle: json["meta_title"] == null ? null : json["meta_title"],
        metaDescription: json["meta_description"],
        doctorId: json["doctor_id"] == null ? null : json["doctor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "language_id": languageId,
        "group_id": groupId,
        "active": active == null ? null : active,
        "meta_title": metaTitle == null ? null : metaTitle,
        "meta_description": metaDescription,
        "doctor_id": doctorId == null ? null : doctorId,
      };
}

class Hours {
  Hours({
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
  List<HoursData> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Hours.fromJson(Map<String, dynamic> json) => Hours(
        isSuccess: json["is_success"],
        message: json["message"],
        data: json["data"],
        datas: List<HoursData>.from(
            json["datas"].map((x) => HoursData.fromJson(x))),
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

class HoursData {
  HoursData({
    this.id,
    this.type,
    this.parentId,
    this.day,
    this.opening,
    this.closeing,
    this.active,
  });

  int id;
  int type;
  int parentId;
  String day;
  String opening;
  String closeing;
  bool active;

  factory HoursData.fromJson(Map<String, dynamic> json) => HoursData(
        id: json["id"],
        type: json["type"],
        parentId: json["parent_id"],
        day: json["day"],
        opening: json["opening"] == null ? null : json["opening"],
        closeing: json["closeing"] == null ? null : json["closeing"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "parent_id": parentId,
        "day": day,
        "opening": opening == null ? null : opening,
        "closeing": closeing == null ? null : closeing,
        "active": active,
      };
}

class Police {
  Police({
    this.title,
    this.link,
  });

  String title;
  String link;

  factory Police.fromJson(Map<String, dynamic> json) => Police(
        title: json["title"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
      };
}
