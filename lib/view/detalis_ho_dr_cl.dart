import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gpluseclinicapp/model/disease/diseas_list.dart';
import 'package:cached_network_image/cached_network_image.dart';




class DetailsData extends StatelessWidget {
  HospitalDoctorClinic hospitalDoctorClinic;



  DetailsData(this.hospitalDoctorClinic);
  String urlImage="https://gplusclinic.com/images/upload/";

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Details of :"+ hospitalDoctorClinic.name)),
        body: SafeArea(
          child: Center(
            child:Container(
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    Container(

                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      width: MediaQuery.of(context).size.width-80,
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(10),
                        child: CachedNetworkImage(imageUrl:urlImage+hospitalDoctorClinic.image),

                      ),
                    ),

                       Container(
                         margin:EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15) ,
                         width: 250,
                         decoration: BoxDecoration(
                         color: Colors.white,
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
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                         child:   Container(
                          padding: EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
                          width: MediaQuery.of(context).size.width-10,
                          alignment: Alignment.topCenter,
                          child:  Html(
                              data:hospitalDoctorClinic.content,style: {
                            'h2': Style(
                              color: Colors.black,
                              fontSize: FontSize.large,
                            ),
                            'p': Style(
                                color: Colors.black87,
                                fontSize: FontSize.xxSmall
                            ),
                            'h3': Style(
                                color: Colors.black87,
                                fontSize: FontSize.xxSmall
                            ),
                            'h4': Style(
                                color: Colors.black87,
                                fontSize: FontSize.xxSmall
                            ),
                            'div': Style(
                                color: Colors.black87,
                                fontSize: FontSize.small
                            ),

                          })
                      ),
                       ),

                  ],
                ),

                  )
            ),
          ),
        ),);
    }
  }
