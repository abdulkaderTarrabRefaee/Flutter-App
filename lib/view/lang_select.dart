
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/view/enter_method_view.dart';
import 'package:gpluseclinicapp/view/home_view.dart';
class LangView extends StatefulWidget {
  @override
  _LangViewState createState() => _LangViewState();
}

class _LangViewState extends State<LangView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Languages.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-(40*(MediaQuery.of(context).size.height))/100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(

                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => EnterView()));
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
                  child: Center(child: Text("English",style:TextStyle(color: Colors.white) ,)))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(

                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => EnterView()));
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
                  child: Center(child: Text("العربية",style:TextStyle(color: Colors.white) ,)))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(

                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => EnterView()));
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
                  child: Center(child: Text("Türkçe",style:TextStyle(color: Colors.white) ,)))),
            ),
          ],
        )),
      ) /* add child content here */,
    ),);
  }
}
