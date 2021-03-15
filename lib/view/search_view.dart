import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:gpluseclinicapp/view/detalis_ho_dr_cl.dart';

import 'package:cached_network_image/cached_network_image.dart';
String urlImage="https://gplusclinic.com/images/upload/";


// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  List<HospitalDoctorClinic> hospitalDoctorClinic;


  SearchView(this.hospitalDoctorClinic);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Search Result")),
        body: SafeArea(
            child: Center(
            child:Container(
      child: Center(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: hospitalDoctorClinic.length,
          itemBuilder: (BuildContext context, int index) {
            return cardItem(context,hospitalDoctorClinic[index]);
          }
      )
    ),
    ),
    ),
    ),);
  }
}
Widget cardItem(BuildContext context , HospitalDoctorClinic hospitalDoctorClinic){
  return SingleChildScrollView(
   child: Column(
     children: [

     InkWell(
   child: Container(
         height:250,
         padding:EdgeInsets.only(top: 30),
     decoration: BoxDecoration(
       color: Colors.white70,
       borderRadius: BorderRadius.only(
           topLeft: Radius.circular(10),
           topRight: Radius.circular(10),
           bottomLeft: Radius.circular(10),
           bottomRight: Radius.circular(10)
       ),
       boxShadow: [
         BoxShadow(
           color: Colors.grey.withOpacity(0.5),
           spreadRadius: 5,
           blurRadius: 7,
           offset: Offset(0, 3),
         ),
       ],

     ),
         child:Row(
           children: [
             Container(

               child: Container(
                 width: 100,
                 margin: EdgeInsets.only(left: 15, right: 15),
                 alignment: Alignment.topCenter,
                 child: ClipRRect(
                   borderRadius:
                   BorderRadius.circular(10),
                   child: CachedNetworkImage(imageUrl:urlImage+hospitalDoctorClinic.image),

                 ),
               ),
             ),



             Column(

               children: [
                 new Divider(
                   indent: 16,
                   endIndent: 16,
                   color: Colors.black,
                 ),
                 Container(
                   width: 200,
                   height: 20,
                   alignment: Alignment.topLeft,
                   child: Text(hospitalDoctorClinic.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                 ),
                 Container(
                   width: 200,
                   height: 150,
                   margin: EdgeInsets.only(top: 10,bottom: 10),

                   alignment: Alignment.topLeft,
                  child: Text(  hospitalDoctorClinic.summary)
                   //child:Text(),
                 ),


               ],


             ),

           ],

         ),
       ),
    onTap: () {
      print(hospitalDoctorClinic.name);
      _showResultSearch(context,hospitalDoctorClinic);

    },
  ),
       Container(

         height: 10,
         padding:EdgeInsets.only(bottom: 0),
         child:Divider(
           indent: 16,
           endIndent: 16,
           color: Colors.black12,
         ),
       )

     ],
   )
   // child: Center(child: Text(hospitalDoctorClinic.name)),
  );
}
void _showResultSearch(BuildContext context, HospitalDoctorClinic hospitalDoctorClinics) {
  Navigator.push(context, MaterialPageRoute(builder: (_)
  {
    return DetailsData(hospitalDoctorClinics);
  }));
}