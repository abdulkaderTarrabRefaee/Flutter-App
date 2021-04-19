import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/view/lang_select.dart';
class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 4),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LangView())));
    var assetsImage = new AssetImage(
        'images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        width: 200,); //<- Creates a widget that displays an image.
    return  Container(
          width: double.infinity,
          height:double.infinity ,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [  const Color(0xFF00a99d), const Color(0xFF29abe2)],transform: GradientRotation(35.0))
          ),
          child: new Center(
            child: image,
          ),
    );
  }
}