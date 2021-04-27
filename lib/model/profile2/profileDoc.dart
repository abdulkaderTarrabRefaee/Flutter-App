// To parse this JSON data, do
//
//     final dataGplus = dataGplusFromJson(jsonString);

import 'dart:convert';

ProfileDoc dataGplusFromJson(String str) => ProfileDoc.fromJson(json.decode(str));

String dataGplusToJson(ProfileDoc data) => json.encode(data.toJson());

class ProfileDoc {
  ProfileDoc({
    this.profile,
    this.rates,
    this.treatments,
    this.page,
    this.staff,
    this.gallery,
    this.hours,
    this.cities,
    this.polices,
    this.units,
    this.isFav,
  });

  Cities profile;
  Rates rates;
  Treatments treatments;
  dynamic page;
  Cities staff;
  Gallery gallery;
  Hours hours;
  Cities cities;
  List<Police> polices;
  Units units;
  bool isFav;

  factory ProfileDoc.fromJson(Map<String, dynamic> json) => ProfileDoc(
    profile: Cities.fromJson(json["profile"]),
    rates: Rates.fromJson(json["rates"]),
    treatments: Treatments.fromJson(json["treatments"]),
    page: json["page"],
    gallery: Gallery.fromJson(json["gallery"]),
    hours: Hours.fromJson(json["hours"]),
    cities: Cities.fromJson(json["cities"]),
    polices: List<Police>.from(json["polices"].map((x) => Police.fromJson(x))),
    units: Units.fromJson(json["units"]),
    isFav: json["isFav"],
  );

  Map<String, dynamic> toJson() => {
    "profile": profile.toJson(),
    "rates": rates.toJson(),
    "treatments": treatments.toJson(),
    "page": page,
    "staff": staff.toJson(),
    "gallery": gallery.toJson(),
    "hours": hours.toJson(),
    "cities": cities.toJson(),
    "polices": List<dynamic>.from(polices.map((x) => x.toJson())),
    "units": units.toJson(),
    "isFav": isFav,
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
    datas: json["datas"] == null ? null : List<FluffyData>.from(json["datas"].map((x) => FluffyData.fromJson(x))),
    totalRows: json["total_rows"],
    pageNumber: json["page_number"],
    rowsCount: json["rows_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": message,
    "data": data == null ? null : data.toJson(),
    "datas": datas == null ? null : List<dynamic>.from(datas.map((x) => x.toJson())),
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
  dynamic address2;
  int countryId;
  String city;
  String cityName;
  String state;
  String stateName;
  String postCode;
  String location;
  String phone;
  dynamic phone2;
  String currencyId;
  dynamic unitName;
  int type;
  dynamic title;
  dynamic genus;
  String content;
  String image;
  String link;
  String metaTitle;
  String metaDescription;
  String canonicalLink;
  int languageId;
  String paymentValue;
  int rateAverage;
  String summary;
  dynamic languages;
  dynamic expertise;
  List<String> units;
  int statusId;
  dynamic titleId;
  int clinicId;
  int hospitalId;
  dynamic unitId;
  dynamic jobTitleId;
  dynamic genusId;
  List<Insurance> paymentMethods;
  List<Insurance> insurances;
  bool showAddress;
  String address;
  bool isAward;
  bool isFreeConsultation;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
    languages: json["languages"],
    expertise: json["expertise"],
    units: List<String>.from(json["units"].map((x) => x)),
    statusId: json["status_id"],
    titleId: json["title_id"],
    clinicId: json["clinic_id"],
    hospitalId: json["hospital_id"],
    unitId: json["unit_id"],
    jobTitleId: json["job_title_id"],
    genusId: json["genus_id"],
    paymentMethods: List<Insurance>.from(json["paymentMethods"].map((x) => Insurance.fromJson(x))),
    insurances: List<Insurance>.from(json["insurances"].map((x) => Insurance.fromJson(x))),
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
    "languages": languages,
    "expertise": expertise,
    "units": List<dynamic>.from(units.map((x) => x)),
    "status_id": statusId,
    "title_id": titleId,
    "clinic_id": clinicId,
    "hospital_id": hospitalId,
    "unit_id": unitId,
    "job_title_id": jobTitleId,
    "genus_id": genusId,
    "paymentMethods": List<dynamic>.from(paymentMethods.map((x) => x.toJson())),
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
    this.parentId,
    this.title,
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
    this.active,
    this.metaTitle,
    this.metaDescription,
    this.doctorId,
  });

  int id;
  String name;
  int languageId;
  String groupId;
  int parentId;
  String title;
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
  bool active;
  String metaTitle;
  dynamic metaDescription;
  int doctorId;

  factory FluffyData.fromJson(Map<String, dynamic> json) => FluffyData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
    languageId: json["language_id"] == null ? null : json["language_id"],
    groupId: json["group_id"] == null ? null : json["group_id"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    title: json["title"] == null ? null : json["title"],
    jobTitle: json["job_title"],
    specialisations: json["specialisations"] == null ? null : List<String>.from(json["specialisations"].map((x) => x)),
    languages: json["languages"] == null ? null : List<String>.from(json["languages"].map((x) => x)),
    content: json["content"] == null ? null : json["content"],
    image: json["image"] == null ? null : json["image"],
    units: json["units"] == null ? null : List<String>.from(json["units"].map((x) => x)),
    summary: json["summary"] == null ? null : json["summary"],
    link: json["link"] == null ? null : json["link"],
    rate: json["rate"] == null ? null : json["rate"],
    rateCount: json["rate_count"] == null ? null : json["rate_count"],
    isAward: json["is_award"] == null ? null : json["is_award"],
    isFreeConsultation: json["is_free_consultation"] == null ? null : json["is_free_consultation"],
    active: json["active"] == null ? null : json["active"],
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaDescription: json["meta_description"],
    doctorId: json["doctor_id"] == null ? null : json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name,
    "language_id": languageId == null ? null : languageId,
    "group_id": groupId == null ? null : groupId,
    "parent_id": parentId == null ? null : parentId,
    "title": title == null ? null : title,
    "job_title": jobTitle,
    "specialisations": specialisations == null ? null : List<dynamic>.from(specialisations.map((x) => x)),
    "languages": languages == null ? null : List<dynamic>.from(languages.map((x) => x)),
    "content": content == null ? null : content,
    "image": image == null ? null : image,
    "units": units == null ? null : List<dynamic>.from(units.map((x) => x)),
    "summary": summary == null ? null : summary,
    "link": link == null ? null : link,
    "rate": rate == null ? null : rate,
    "rate_count": rateCount == null ? null : rateCount,
    "is_award": isAward == null ? null : isAward,
    "is_free_consultation": isFreeConsultation == null ? null : isFreeConsultation,
    "active": active == null ? null : active,
    "meta_title": metaTitle == null ? null : metaTitle,
    "meta_description": metaDescription,
    "doctor_id": doctorId == null ? null : doctorId,
  };
}

class Gallery {
  Gallery({
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
  List<GalleryData> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    datas: List<GalleryData>.from(json["datas"].map((x) => GalleryData.fromJson(x))),
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

class GalleryData {
  GalleryData({
    this.id,
    this.image,
    this.type,
    this.parentId,
    this.active,
  });

  int id;
  String image;
  int type;
  int parentId;
  bool active;

  factory GalleryData.fromJson(Map<String, dynamic> json) => GalleryData(
    id: json["id"],
    image: json["image"],
    type: json["type"],
    parentId: json["parent_id"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "type": type,
    "parent_id": parentId,
    "active": active,
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
    datas: List<HoursData>.from(json["datas"].map((x) => HoursData.fromJson(x))),
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
class Treatments {
  Treatments({
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
  List<TreatmentsData> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Treatments.fromJson(Map<String, dynamic> json) => Treatments(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    datas: List<TreatmentsData>.from(json["datas"].map((x) => TreatmentsData.fromJson(x))),
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

class TreatmentsData {
  TreatmentsData({
    this.id,
    this.parentId,
    this.name,
    this.active,
    this.languageId,
    this.groupId,
    this.typeId,
    this.minPrice,
    this.maxPrice,
    this.duration,
    this.visits,
    this.description,
    this.image,
    this.image2,
    this.file,
    this.file2,
  });

  int id;
  int parentId;
  String name;
  bool active;
  int languageId;
  String groupId;
  int typeId;
  double minPrice;
  double maxPrice;
  String duration;
  String visits;
  dynamic description;
  dynamic image;
  dynamic image2;
  dynamic file;
  dynamic file2;

  factory TreatmentsData.fromJson(Map<String, dynamic> json) => TreatmentsData(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    active: json["active"],
    languageId: json["language_id"],
    groupId: json["group_id"],
    typeId: json["type_id"],
    minPrice: json["min_price"],
    maxPrice: json["max_price"],
    duration: json["duration"] == null ? null : json["duration"],
    visits: json["visits"] == null ? null : json["visits"],
    description: json["description"],
    image: json["image"],
    image2: json["image2"],
    file: json["file"],
    file2: json["file2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "active": active,
    "language_id": languageId,
    "group_id": groupId,
    "type_id": typeId,
    "min_price": minPrice,
    "max_price": maxPrice,
    "duration": duration == null ? null : duration,
    "visits": visits == null ? null : visits,
    "description": description,
    "image": image,
    "image2": image2,
    "file": file,
    "file2": file2,
  };
}

class Rates {
  Rates({
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
  List<AnswerElement> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    datas: List<AnswerElement>.from(json["datas"].map((x) => AnswerElement.fromJson(x))),
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

class AnswerElement {
  AnswerElement({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.rate,
    this.comment,
    this.typeId,
    this.topId,
    this.isDelete,
    this.parentId,
    this.status,
    this.reply,
    this.date,
    this.memberId,
    this.parentName,
    this.isFavInt,
    this.isFav,
    this.answers,
    this.favCount,
  });

  int id;
  String email;
  String name;
  String phone;
  int rate;
  String comment;
  int typeId;
  int topId;
  int isDelete;
  int parentId;
  int status;
  dynamic reply;
  DateTime date;
  int memberId;
  dynamic parentName;
  int isFavInt;
  bool isFav;
  List<AnswerElement> answers;
  int favCount;

  factory AnswerElement.fromJson(Map<String, dynamic> json) => AnswerElement(
    id: json["id"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    rate: json["rate"],
    comment: json["comment"],
    typeId: json["type_id"],
    topId: json["top_id"],
    isDelete: json["is_delete"],
    parentId: json["parent_id"],
    status: json["status"],
    reply: json["reply"],
    date: DateTime.parse(json["date"]),
    memberId: json["member_id"],
    parentName: json["parent_name"],
    isFavInt: json["isFavInt"],
    isFav: json["isFav"],
    answers: json["answers"] == null ? null : List<AnswerElement>.from(json["answers"].map((x) => AnswerElement.fromJson(x))),
    favCount: json["favCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "rate": rate,
    "comment": comment,
    "type_id": typeId,
    "top_id": topId,
    "is_delete": isDelete,
    "parent_id": parentId,
    "status": status,
    "reply": reply,
    "date": date.toIso8601String(),
    "member_id": memberId,
    "parent_name": parentName,
    "isFavInt": isFavInt,
    "isFav": isFav,
    "answers": answers == null ? null : List<dynamic>.from(answers.map((x) => x.toJson())),
    "favCount": favCount,
  };
}



class Units {
  Units({
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
  List<Data> datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  factory Units.fromJson(Map<String, dynamic> json) => Units(
    isSuccess: json["is_success"],
    message: json["message"],
    data: json["data"],
    datas: List<Data>.from(json["datas"].map((x) => Data.fromJson(x))),
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

class Data {
  Data({
    this.id,
    this.name,
    this.active,
    this.metaTitle,
    this.metaDescription,
    this.languageId,
    this.groupId,
    this.doctorId,
  });

  int id;
  String name;
  bool active;
  String metaTitle;
  dynamic metaDescription;
  int languageId;
  String groupId;
  int doctorId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    languageId: json["language_id"],
    groupId: json["group_id"],
    doctorId: json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active": active,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "language_id": languageId,
    "group_id": groupId,
    "doctor_id": doctorId,
  };
}
