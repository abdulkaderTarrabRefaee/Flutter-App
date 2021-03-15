import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/view/home_view.dart';
import 'package:gpluseclinicapp/view_models/list_of_hos_dr_cl.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';
import 'package:gpluseclinicapp/view_models/list_of_disease_view_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffFEFDFD),
          appBarTheme: AppBarTheme(
            color: Color(0xffFEFDFD),
            elevation: 0,
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => CityListViewModel(),

            ),
            ChangeNotifierProvider(
              create: (_) => DiseaseListViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => HospitalDoctorClinicViewModel(),
            ),
          ],


          child:MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
               "/": (context) => HomeView(),

            },
          )



        )
    );
  }
}