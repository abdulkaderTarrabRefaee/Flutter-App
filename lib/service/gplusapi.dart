import 'dart:convert';
import 'dart:math';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/model/disease/diseaslist.dart';
import 'package:http/http.dart' as http;
import 'package:gpluseclinicapp/model/city/city_list.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Gplus_api {

  final String apiKey = 'd8e093f3-9a0f-489e-87b8-12a892320900';
  final String url='http://api.gplusclinic.com/api/homepage/2';
  Future<List<City>> fetchCity() async {
    try {

      http.Response response = await http.get(
          url,
          headers: {'Apikey': apiKey,
                    'Connection':'keep-alive',
                    'Accept-Encoding':'gzip, deflate, br',
                    'Accept':'*/*',
          });
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        CityList cityListMap =CityList.fromJson(jsonData);
        List<dynamic> citiesList =
        cityListMap.cities.map((e) => City.fromJson(e)).toList();
        return citiesList;
      }
      else
        {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
  Future<List<Disease>> fetchDisease() async {
    try {

      http.Response response = await http.get(
          url,
          headers: {'Apikey': apiKey,
            'Connection':'keep-alive',
            'Accept-Encoding':'gzip, deflate, br',
            'Accept':'*/*',
          });
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        DiseaseList diseaseListMap =DiseaseList.fromJson(jsonData);
        List<dynamic> diseaseList =
        diseaseListMap.disease.map((e) => Disease.fromJson(e)).toList();
        return diseaseList;
      }
      else
      {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

}