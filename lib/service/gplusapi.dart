import 'dart:convert';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search_list.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/model/disease/diseas_list.dart';
import 'package:gpluseclinicapp/model/profile/profile.dart';
import 'package:gpluseclinicapp/model/profile/profile_list.dart';
import 'package:http/http.dart' as http;
import 'package:gpluseclinicapp/model/city/city_list.dart';
//2 for en ,, 3 for ar

final String lang = "2";

class GplusApi {
  final String apiKey = 'd8e093f3-9a0f-489e-87b8-12a892320900';
  final String url = 'http://api.gplusclinic.com/api/homepage/' + lang;
  fetchCity() async {
    try {
      http.Response response = await http.get(url, headers: {
        'Apikey': apiKey,
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept': '*/*',
      });
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        CityList cityListMap = CityList.fromJson(jsonData);
        List<dynamic> citiesList =
            cityListMap.cities.map((e) => City.fromJson(e)).toList();
        return citiesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  fetchDisease() async {
    try {
      http.Response response = await http.get(url, headers: {
        'Apikey': apiKey,
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept': '*/*',
      });
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        DiseaseList diseaseListMap = DiseaseList.fromJson(jsonData);
        List<dynamic> diseaseList =
            diseaseListMap.disease.map((e) => Disease.fromJson(e)).toList();
        return diseaseList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  fetchDataSearch(
      dropdownCitySelected, dropdownDiseaseSelected, typeSelected, int pageNamber) async {
    var city;
    var disease;
    print(pageNamber);
    int conBoolToInt(List<bool> typeSelected) {
      if (typeSelected[0] == true)
        //all
        return 0;
      if (typeSelected[1] == true)
        //hospital
        return 1;
      if (typeSelected[2] == true)
        //doctor
        return 2;
      if (typeSelected[3] == true)
        //clinic
        return 3;
      return 0;
    }

    if (dropdownCitySelected == null) {
      city = "";
    } else
      city = dropdownCitySelected.group_id.toLowerCase();

    if (dropdownDiseaseSelected == null) {
      disease = "";
    } else
      disease = dropdownDiseaseSelected.group_id.toLowerCase();

    String searchUrl = 'http://api.gplusclinic.com/api/SearchPage?city=' +
        city +
        '&page='+pageNamber.toString()+'&medicalUnit=' +
        disease +
        '&type=' +
        conBoolToInt(typeSelected).toString();
    http.Response response = await http.get(searchUrl, headers: {
      'Apikey': apiKey,
      'Connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      HospitalDoctorClinicList hospitalDoctorClinicListMap =
          HospitalDoctorClinicList.fromJson(jsonData);
      List<HospitalDoctorClinic> hospitalDoctorClinicLists =
          hospitalDoctorClinicListMap.hospitalDoctorClinicList
              .map((e) => HospitalDoctorClinic.fromJson(e))
              .toList();
      return hospitalDoctorClinicLists;
    } else {
      print('status code = ${response.statusCode}');
    }
  }

  fetchDataSearchCity() async {
    String searchUrl =
        'http://api.gplusclinic.com/api/SearchPage?city=&page=1&medicalUnit=&type=0';
    http.Response response = await http.get(searchUrl, headers: {
      'Apikey': apiKey,
      'Connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      CityHospitalDoctorClinicList cityhospitalDoctorClinicListMap =
          CityHospitalDoctorClinicList.fromJson(jsonData);
      List<ContantData> cityHospitalDoctorClinicLists =
          cityhospitalDoctorClinicListMap.cityHospitalDoctorClinicList
              .map((e) => ContantData.fromJson(e))
              .toList();
      return cityHospitalDoctorClinicLists;
    } else {
      print('status code = ${response.statusCode}');
    }
  }

  Future<ProfileData> fetchProfileData(
      HospitalDoctorClinic hospitalDoctorClinic, int type) async {
    String searchUrl = 'http://api.gplusclinic.com/api/ProfilePage/' +
        hospitalDoctorClinic.link +
        ' /' +
        type.toString() +
        '/' +
        lang.toString() +
        '';
    http.Response response = await http.get(searchUrl, headers: {
      'Apikey': apiKey,
      'Connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      ProfileData profileData =
      ProfileData.fromJson(jsonData['profile']['data']);
      return profileData;
    } else {
      print('status code = ${response.statusCode}');
      return null;
    }
  }
  Future<Content> fetchContentData( dropdownCitySelected, dropdownDiseaseSelected, typeSelected, int pageNamber) async {
    var city;
    var disease;
    print(pageNamber);
    int conBoolToInt(List<bool> typeSelected) {
      if (typeSelected[0] == true)
        //all
        return 0;
      if (typeSelected[1] == true)
        //hospital
        return 1;
      if (typeSelected[2] == true)
        //doctor
        return 2;
      if (typeSelected[3] == true)
        //clinic
        return 3;
      return 0;
    }

    if (dropdownCitySelected == null) {
      city = "";
    } else
      city = dropdownCitySelected.group_id.toLowerCase();

    if (dropdownDiseaseSelected == null) {
      disease = "";
    } else
      disease = dropdownDiseaseSelected.group_id.toLowerCase();

    String searchUrl = 'http://api.gplusclinic.com/api/SearchPage?city=' +
        city +
        '&page='+pageNamber.toString()+'&medicalUnit=' +
        disease +
        '&type=' +
        conBoolToInt(typeSelected).toString();
    http.Response response = await http.get(searchUrl, headers: {
      'Apikey': apiKey,
      'Connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      Content contentData =
      Content.fromJson(jsonData['content']);
      return contentData;
    } else {
      print('status code = ${response.statusCode}');
      return null;
    }
  }
}
