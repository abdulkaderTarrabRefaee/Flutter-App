import 'dart:convert';
import 'dart:math';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_gplus.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_gplus_list.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/model/disease/diseas_list.dart';
import 'package:http/http.dart' as http;
import 'package:gpluseclinicapp/model/city/city_list.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class GplusApi {
  final String apiKey = 'd8e093f3-9a0f-489e-87b8-12a892320900';
  final String url='http://api.gplusclinic.com/api/homepage/3';
  final String searchUrl='http://api.gplusclinic.com/api/SearchPage?city=&page=1&medicalUnit=&type=0';

  fetchCity() async {
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
   fetchDisease() async {
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
  fetchDataSearch() async {
    try {

      http.Response response = await http.get(
          searchUrl,
          headers: {'Apikey': apiKey,
            'Connection':'keep-alive',
            'Accept-Encoding':'gzip, deflate, br',
            'Accept':'*/*',
          });
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        DataGplusList dataGplusList =DataGplusList.fromJson(jsonData);
        List<dynamic> GplusListData =
        dataGplusList.dataGpList.map((e) => DataGplus.fromJson(e)).toList();
        print(GplusListData.length);
        return GplusListData;
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