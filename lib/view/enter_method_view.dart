
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/view/Login_view.dart';
import 'package:gpluseclinicapp/view/home_view.dart';
import 'package:gpluseclinicapp/view/regstier_view.dart';
class EnterView extends StatefulWidget {
  @override
  _EnterViewState createState() => _EnterViewState();
}

class _EnterViewState extends State<EnterView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/EnterMethod.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                  height:  MediaQuery.of(context).size.height-(83*(MediaQuery.of(context).size.height))/100,
                child: Image(image: AssetImage(
                    'images/logo.png'))),

              Center(child: Text("Find a Doctor in Turkey Make an Appointment",style:TextStyle(fontSize: 20) ,textAlign:TextAlign.center ,)),
              Container(
                  height:  MediaQuery.of(context).size.height-(60*(MediaQuery.of(context).size.height))/100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => LoginView()));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: [
                        BoxShadow(color:  const Color(0xFF76b8bd), spreadRadius: 1),
                      ],
                      image: DecorationImage(
                        image: AssetImage("images/button.png"),

                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment_turned_in,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Sign In ",style:TextStyle(color: Colors.white) ,),
                        ],
                      ),
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => RegisterView()));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: [
                        BoxShadow(color:  const Color(0xFF76b8bd), spreadRadius: 1),
                      ],
                      image: DecorationImage(
                        image: AssetImage("images/button.png"),

                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Sign Up",style:TextStyle(color: Colors.white) ,),
                        ],
                      ),
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomeView()));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: [
                        BoxShadow(color:  const Color(0xFF76b8bd), spreadRadius: 1),
                      ],
                      image: DecorationImage(
                        image: AssetImage("images/button.png"),

                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Log in as a user",style:TextStyle(color: Colors.white) ,),
                        ],
                      ),
                    ))),
              ),

            ],
          )),
        ) /* add child content here */,
      ),);
  }
}
