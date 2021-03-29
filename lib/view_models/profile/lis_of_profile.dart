
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/profile/profile.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

class ProfileListViewModel extends ChangeNotifier
{
  int type;
  int lang;
  HospitalDoctorClinic hospitalDoctorClinic;
  PurpleData profileData;
  Future<PurpleData> fetchProfile(hospitalDoctorClinic, type, lang) async
  {
    await GplusApi().fetchProfileData(hospitalDoctorClinic, type, lang);

    notifyListeners();
  }

}


