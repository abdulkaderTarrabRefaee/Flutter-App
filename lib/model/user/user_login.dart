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
}
