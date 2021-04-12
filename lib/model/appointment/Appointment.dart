class AppointmentPost {
  int id;
  String mail;
  String name;
  int status;
  String phone;
  String fullPhone;
  String message;
  String unitId;
  String date;
  List<String> treatments;
  String createDate;
  int type;
  int parentId;
  int staffId;
  String staffName;
  String profileLink;
  int memberId;
  List<String> fileBase64;

  AppointmentPost(
      {this.id,
        this.mail,
        this.name,
        this.status,
        this.phone,
        this.fullPhone,
        this.message,
        this.unitId,
        this.date,
        this.treatments,
        this.createDate,
        this.type,
        this.parentId,
        this.staffId,
        this.staffName,
        this.profileLink,
        this.memberId,
        this.fileBase64});

  AppointmentPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mail = json['mail'];
    name = json['name'];
    status = json['status'];
    phone = json['phone'];
    fullPhone = json['full_phone'];
    message = json['message'];
    unitId = json['unit_id'];
    date = json['date'];
    treatments = json['treatments'].cast<String>();
    createDate = json['create_date'];
    type = json['type'];
    parentId = json['parent_id'];
    staffId = json['staff_id'];
    staffName = json['staff_name'];
    profileLink = json['profile_link'];
    memberId = json['member_id'];
    fileBase64 = json['fileBase64'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mail'] = this.mail;
    data['name'] = this.name;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['full_phone'] = this.fullPhone;
    data['message'] = this.message;
    data['unit_id'] = this.unitId;
    data['date'] = this.date;
    data['treatments'] = this.treatments;
    data['create_date'] = this.createDate;
    data['type'] = this.type;
    data['parent_id'] = this.parentId;
    data['staff_id'] = this.staffId;
    data['staff_name'] = this.staffName;
    data['profile_link'] = this.profileLink;
    data['member_id'] = this.memberId;
    data['fileBase64'] = this.fileBase64;
    return data;
  }
}