class UserLogin {
  String email;
  String password;
  bool isGuest;
  String returnUrl;
  dynamic externalLogins;

  UserLogin({this.email, this.password, this.isGuest, this.returnUrl,
      this.externalLogins});
  factory UserLogin.fromJson(Map<dynamic, dynamic> jsonData)
  {
    return UserLogin(
      email: jsonData['Email'],
     externalLogins: jsonData['ExternalLogins'],
      isGuest: jsonData['IsGuest'],
      password: jsonData['Password'],
      returnUrl: jsonData['returnUrl']

    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['externalLogins'] = this.externalLogins;
    data['IsGuest'] = this.isGuest;
    data['Password'] = this.password;
    data['returnUrl'] = this.returnUrl;
    return data;
  }

}

class ReqUserLogin {
  bool isSuccess;
  String message;
  Data data;
  Null datas;
  int totalRows;
  int pageNumber;
  int rowsCount;
  int totalPage;

  ReqUserLogin(
      {this.isSuccess,
        this.message,
        this.data,
        this.datas,
        this.totalRows,
        this.pageNumber,
        this.rowsCount,
        this.totalPage});

  ReqUserLogin.fromJson(Map<String, dynamic> json) {
    isSuccess = json['is_success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    datas = json['datas'];
    totalRows = json['total_rows'];
    pageNumber = json['page_number'];
    rowsCount = json['rows_count'];
    totalPage = json['total_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_success'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['datas'] = this.datas;
    data['total_rows'] = this.totalRows;
    data['page_number'] = this.pageNumber;
    data['rows_count'] = this.rowsCount;
    data['total_page'] = this.totalPage;
    return data;
  }
}

class Data {
  int id;
  String email;
  String token;
  int type;

  Data({this.id, this.email, this.token, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }
}