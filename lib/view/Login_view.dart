import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/custom_icon.dart';
import 'package:gpluseclinicapp/model/user/user_login.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/home_view.dart';
import 'package:gpluseclinicapp/view/regstier_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String emailController="" ;
  String passController="" ;
  String token="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Builder(
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              child: Container(

                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/pluses.png"),
                    alignment: Alignment(1.5, -0.9),
                    repeat: ImageRepeat.noRepeat,scale: 6
                  ),

                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFF00a99d),
                          const Color(0xFF29abe2)
                        ],
                        transform: GradientRotation(35.0))),
                child: new Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text("SIGN IN ",style: TextStyle(
                        color: Colors.white,fontSize: 24,fontWeight: FontWeight.w800
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 330, height: 60),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(CustomIcon.facebook, size: 25),
                          label: Text(" Login with your Facebook",
                              style: TextStyle(fontSize: 15)),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                style: BorderStyle.solid,
                                width: 1)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff4d69a2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 330, height: 60),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(CustomIcon.google_plus_g, size: 25),
                          label: Text("  Login with your Google",
                              style: TextStyle(fontSize: 15)),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                style: BorderStyle.solid,
                                width: 1)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xffd73d32)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.compare_arrows,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "OR",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          cursorColor: Colors.white60,

                          scrollPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0),
                          onChanged: (value) {
                            setState(() {
                              emailController=value;
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.person,
                              color: const Color(0xffffffff),
                            ),
                            hintText: ' E-mail Address *',
                            hintStyle: TextStyle(
                              color: Colors.white60
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white60, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                            cursorColor: Colors.white60,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0),
                          onChanged: (value) {
                            setState(() {
                              passController=value;
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.security,
                              color: const Color(0xffffffff),
                            ),
                            hintText: ' Password *',
                            hintStyle: TextStyle(
                                color: Colors.white60
                            ),
                            counterStyle: TextStyle(
                                color: Colors.white60
                            ),
                            labelStyle: TextStyle(
                                color: Colors.white60
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white60, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        child: InkWell(
                          child: Text("Forgot password?",style:TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),),
                          onTap: (){
                            print('Forgot password');
                          },
                        ),
                      ),


                      SizedBox(
                        height: 200,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                UserLogin userLogin =new UserLogin(
                                  email: emailController,
                                  password: passController,
                                  returnUrl: ""
                                    ,externalLogins: false,
                                  isGuest: true
                                );
                                Stream.fromFuture(GplusApi().LoginPost(userLogin))
                                    .listen((event) async {

                                      print(event.data.token);
                                      token=event.data.token;
                                      if(token!="") {
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setString('token', token);
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (
                                                    BuildContext context) =>
                                                    HomeView()));
                                      }
                                      else print("pass error");
                                  return (event.data.token);
                                });

                              });


                            },
                            child: Container(
                                width: 325,
                                height: 51,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xFF76b8bd),
                                        spreadRadius: 1),
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("images/button.png"),
                                      fit: BoxFit.fill),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.assignment_turned_in,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "SIGN IN ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Tahoma',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              RegisterView()));
                                },
                                child: Container(
                                    width: 155,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFFb5b5b5),
                                          const Color(0xFFfcfbf9)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.assignment_turned_in,
                                            color: const Color(0xFF05837b),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "SIGN UP ",
                                            style: TextStyle(
                                                color: const Color(0xFF05837b),
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeView()));
                                },
                                child: Container(
                                    width: 155,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFFb5b5b5),
                                          const Color(0xFFfcfbf9)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.assignment_turned_in,
                                            color: const Color(0xFF05837b),
                                          ),

                                          Text(
                                            "Log in as a user",
                                            style: TextStyle(
                                                color: const Color(0xFF05837b),
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
