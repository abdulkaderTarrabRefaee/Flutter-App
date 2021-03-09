import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

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
            return cardItem(hospitalDoctorClinic[index]);
          }
      )
    ),
    ),
    ),
    ),);
  }
}
Widget cardItem(HospitalDoctorClinic hospitalDoctorClinic){
  return SingleChildScrollView(
   child: Column(
     children: [
       Container(
         height: 10,
         padding:EdgeInsets.only(bottom: 10),
         child:Divider(
           indent: 16,
           endIndent: 16,
           color: Colors.grey,
         ),
       ),

       Container(
         height:250,
         color: Color(0xffdfdfdf),
         padding:EdgeInsets.only(top: 30),
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
                   child: Image.network(urlImage+hospitalDoctorClinic.image),
                 ),
               ),
             ),


             Column(

               children: [

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
                   child:  Html(
                     data:hospitalDoctorClinic.summary,style: {
                     'h2': Style(

                         color: Colors.red,

                     ),
                     'p': Style(
                         color: Colors.black87,
                         fontSize: FontSize.medium
                     ),
                     'ul': Style(
                         margin: EdgeInsets.symmetric(vertical: 20)
                     )
                   })
                   //child:Text(),
                 ),


               ],


             ),

           ],

         ),
       ),

     ],
   )
   // child: Center(child: Text(hospitalDoctorClinic.name)),
  );
}
