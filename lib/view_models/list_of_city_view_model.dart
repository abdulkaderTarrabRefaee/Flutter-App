import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
class CityListViewModel extends ChangeNotifier
{
  List<City> _citiesList=[];
  fetchCity() async
  {
    _citiesList =await GplusApi().fetchCity();
    notifyListeners();
  }
  List<City> get citiesList => _citiesList;
}