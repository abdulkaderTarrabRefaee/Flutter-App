class DataGplus {
  DataGplus({
    this.id,
    this.type,
    this.address1,
    this.address2,
    this.title,
    this.genus,
    this.name,
    this.content,
    this.image,
    this.link,
    this.metaTitle,
    this.metaDescription,
    this.canonicalLink,
    this.groupId,
    this.languageId,
    this.isDelete,
    this.showAddress,
    this.currencyId,
    this.summary,
    this.rate,
    this.rateCount,
    this.address,
    this.paymentValue,
    this.isAward,
    this.isFreeConsultation,
    this.treatments,
    this.unitName,
    this.clinicId,
    this.hospitalId,
  });

  int id;
  int type;
  String address1;
  dynamic address2;
  dynamic title;
  dynamic genus;
  String name;
  String content;
  String image;
  String link;
  String metaTitle;
  String metaDescription;
  String canonicalLink;
  int groupId;
  int languageId;
  bool isDelete;
  bool showAddress;
  dynamic currencyId;
  String summary;
  int rate;
  int rateCount;
  String address;
  String paymentValue;
  bool isAward;
  bool isFreeConsultation;
  List<Treatment> treatments;
  dynamic unitName;
  int clinicId;
  int hospitalId;

  factory DataGplus.fromJson(Map<String, dynamic> json) => DataGplus(
    id: json["id"],
    type: json["type"],
    address1: json["address1"],
    address2: json["address2"],
    title: json["title"],
    genus: json["genus"],
    name: json["name"],
    content: json["content"],
    image: json["image"],
    link: json["link"],
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaDescription: json["meta_description"] == null ? null : json["meta_description"],
    canonicalLink: json["canonical_link"],
    groupId: json["group_id"],
    languageId: json["language_id"],
    isDelete: json["is_delete"],
    showAddress: json["show_address"],
    currencyId: json["currency_id"],
    summary: json["summary"] == null ? null : json["summary"],
    rate: json["rate"],
    rateCount: json["rate_count"],
    address: json["address"],
    paymentValue: json["payment_value"],
    isAward: json["is_award"],
    isFreeConsultation: json["is_free_consultation"],
    treatments: List<Treatment>.from(json["treatments"].map((x) => Treatment.fromJson(x))),
    unitName: json["unit_name"],
    clinicId: json["clinic_id"],
    hospitalId: json["hospital_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "address1": address1,
    "address2": address2,
    "title": title,
    "genus": genus,
    "name": name,
    "content": content,
    "image": image,
    "link": link,
    "meta_title": metaTitle == null ? null : metaTitle,
    "meta_description": metaDescription == null ? null : metaDescription,
    "canonical_link": canonicalLink,
    "group_id": groupId,
    "language_id": languageId,
    "is_delete": isDelete,
    "show_address": showAddress,
    "currency_id": currencyId,
    "summary": summary == null ? null : summary,
    "rate": rate,
    "rate_count": rateCount,
    "address": address,
    "payment_value": paymentValue,
    "is_award": isAward,
    "is_free_consultation": isFreeConsultation,
    "treatments": List<dynamic>.from(treatments.map((x) => x.toJson())),
    "unit_name": unitName,
    "clinic_id": clinicId,
    "hospital_id": hospitalId,
  };
}

class Treatment {
  Treatment({
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

  factory Treatment.fromJson(Map<String, dynamic> json) => Treatment(
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
