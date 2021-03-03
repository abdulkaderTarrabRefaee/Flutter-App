import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/hom_view.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Gplus_api gplus_api = Gplus_api();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CityListViewModel>(
      create: (context) => CityListViewModel(),
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}