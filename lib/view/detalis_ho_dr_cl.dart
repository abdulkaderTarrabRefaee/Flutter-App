import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/profile/profile.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

import 'package:gpluseclinicapp/view_models/profile/lis_of_profile.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailedProfile extends StatefulWidget {
  HospitalDoctorClinic hospitalDoctorClinic;
  List<bool> typeSelected;

  DetailedProfile( this.hospitalDoctorClinic, this.typeSelected , {Key key}) : super(key: key);

  @override
  _DetailedProfileState createState() => _DetailedProfileState();
}

class _DetailedProfileState extends State<DetailedProfile>
{
  String urlImage="https://gplusclinic.com/images/upload/";
  @override
  void initState() {
    Provider.of<ProfileListViewModel>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


     return FutureBuilder<PurpleData>(

         future:GplusApi().fetchProfileData(widget.hospitalDoctorClinic, widget.hospitalDoctorClinic.type, 2),

         builder: (context,snapshot)
         {
           if(snapshot.hasData)
           {
             return       Scaffold(
               appBar: AppBar(title: Text(snapshot.data.name),),
               body: SafeArea(
                 child: Container(
                     child: Text(snapshot.data.name)
                 ),
               ),
             );

           }
           else
             return SafeArea(
               child: Container(
                 color: Colors.white,
                 child: Center(
                   child:CircularProgressIndicator(),
                 ),
               ),
             );

         }

     );


  }
}
