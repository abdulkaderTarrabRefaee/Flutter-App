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


class GplusApi {
  final String apiKey = 'd8e093f3-9a0f-489e-87b8-12a892320900';
  final String url='http://api.gplusclinic.com/api/homepage/2';

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
  fetchDataSearch( dropdownCitySelected, dropdownDiseaseSelected) async
  {
     String searchUrl='http://api.gplusclinic.com/api/SearchPage?city='+ dropdownCitySelected.name.toLowerCase() +'&page=1&medicalUnit='+ dropdownDiseaseSelected.group_id.toLowerCase() +'&type=0';
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
        HospitalDoctorClinicList hospitalDoctorClinicListMap =HospitalDoctorClinicList.fromJson(jsonData);
        List<HospitalDoctorClinic> hospitalDoctorClinicLists =
        hospitalDoctorClinicListMap.hospitalDoctorClinicList.map((e) => HospitalDoctorClinic.fromJson(e)).toList();
        return hospitalDoctorClinicLists;
      }
      else
      {
        print('status code = ${response.statusCode}');
      }

  }
  fetchDataSearchCity( ) async
  {
    String searchUrl='http://api.gplusclinic.com/api/SearchPage?city=&page=1&medicalUnit=&type=0';
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
      CityHospitalDoctorClinicList cityhospitalDoctorClinicListMap =CityHospitalDoctorClinicList.fromJson(jsonData);
      List<CitiesData> cityHospitalDoctorClinicLists =
      cityhospitalDoctorClinicListMap.cityHospitalDoctorClinicList.map((e) => CitiesData.fromJson(e)).toList();
      return cityHospitalDoctorClinicLists;
    }
    else
    {
      print('status code = ${response.statusCode}');
    }

  }

  fetchProfileData(HospitalDoctorClinic hospitalDoctorClinic ,int type , int lang) async
  {
    String searchUrl='http://api.gplusclinic.com/api/ProfilePage/'+ hospitalDoctorClinic.link + ' /'+ type.toString() + '/'+ lang.toString() +'';
    http.Response response = await http.get(
        searchUrl,
        headers:
        {'Apikey': apiKey,
          'Connection':'keep-alive',
          'Accept-Encoding':'gzip, deflate, br',
          'Accept':'*/*',
        });
    if (response.statusCode == 200)
    {
      String data = response.body;
      var jsonData = jsonDecode(data);
      ProfileList profileListstMap =ProfileList.fromJson(jsonData);
      List<ProfileData> profileListsts =
      profileListstMap.profileList.map((e) => ProfileData.fromJson(e)).toList();
      return profileListsts;
    }
    else
    {
      print('status code = ${response.statusCode}');
    }

  }

}

