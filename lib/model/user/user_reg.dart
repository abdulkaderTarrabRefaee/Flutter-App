class UserReg {
  String firstname;
  String lastname;
  String mail;
  int phone;
  String password;
  int fullClinicContactPhone;
  bool isExternelLogin;
  Null phone2;

  UserReg(
      {this.firstname,
        this.lastname,
        this.mail,
        this.phone,
        this.password,
        this.fullClinicContactPhone,
        this.isExternelLogin,
        this.phone2});

  UserReg.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    mail = json['mail'];
    phone = json['phone'];
    password = json['password'];
    fullClinicContactPhone = json['full_clinicContactPhone'];
    isExternelLogin = json['isExternelLogin'];
    phone2 = json['phone2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['full_clinicContactPhone'] = this.fullClinicContactPhone;
    data['isExternelLogin'] = this.isExternelLogin;
    data['phone2'] = this.phone2;
    return data;
  }
}