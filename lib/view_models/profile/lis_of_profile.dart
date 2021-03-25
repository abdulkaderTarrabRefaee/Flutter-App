
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/profile/profile.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

class ProfileListViewModel extends ChangeNotifier
{
  int type;
  int lang;
  HospitalDoctorClinic hospitalDoctorClinic;
  List<ProfileData> _profileData=[];
  fetchCity(hospitalDoctorClinic, type, lang) async
  {
    _profileData =await GplusApi().fetchProfileData(hospitalDoctorClinic, type, lang);
    notifyListeners();
  }
  List<ProfileData> get profileData => _profileData;



}