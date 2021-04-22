import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/profile2/profileDoc.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/appointment_view.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';



class DetailedProfileDoc extends StatefulWidget {
  HospitalDoctorClinic hospitalDoctorClinic;
  List<bool> typeSelected;

  DetailedProfileDoc(this.hospitalDoctorClinic, this.typeSelected, {Key key})
      : super(key: key);
  @override
  _DetailedProfileDocState createState() => _DetailedProfileDocState();
}

class _DetailedProfileDocState extends State<DetailedProfileDoc> {
  String urlImage = "https://gplusclinic.com/images/upload/";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<ProfileDoc>(
          future: GplusApi().fetchProfileDocData(
              widget.hospitalDoctorClinic, widget.hospitalDoctorClinic.type),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(snapshot.data.profile.data.name),
                ),
                body: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(

                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 80,
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(10),
                              child: Image.network(
                                  urlImage + snapshot.data.profile.data.image),
                            ),
                          ),
                          if(snapshot.data.profile.data.content != null)
                            Container(
                              margin: EdgeInsets.only(top: 15,
                                  bottom: 15,
                                  left: 15,
                                  right: 15),
                              width: 350,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),

                              child:

                              Container(

                                  padding: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15, right: 15),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width - 10,
                                  alignment: Alignment.topCenter,

                                  child:

                                  Html(
                                      data: snapshot.data.profile.data.content,
                                      style: {
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
                          if(snapshot.data.profile.data.expertise.isNotEmpty)
                            Container(
                              margin: EdgeInsets.only(top: 15,
                                  bottom: 15,
                                  left: 15,
                                  right: 15),
                              width: 350,
                              height: 150,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(
                                    snapshot.data.profile.data.expertise
                                        .toString())),
                              ),
                            ),
                          if(snapshot.data.profile.data.languages.isNotEmpty)
                            Container(
                              margin: EdgeInsets.only(top: 15,
                                  bottom: 15,
                                  left: 15,
                                  right: 15),
                              width: 350,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(
                                    snapshot.data.profile.data.languages
                                        .toString())),
                              ),
                            ),
                          if(snapshot.data.profile.data.units.isNotEmpty)

                            Container(
                              margin: EdgeInsets.only(top: 15,
                                  bottom: 15,
                                  left: 15,
                                  right: 15),
                              width: 350,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(
                                    snapshot.data.profile.data.units
                                        .toString())),
                              ),
                            ),
                          if(snapshot.data.profile.data.insurances != null)

                            Container(
                              margin: EdgeInsets.only(top: 15,
                                  bottom: 15,
                                  left: 15,
                                  right: 15),
                              width: 350,
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(_get_insurances(
                                    snapshot.data.treatments.datas).toString())
                                ),
                              ),
                            ),
                          InkWell(onTap: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (_) {
                              return new AppointmentView(
                                  snapshot.data.profile.data);
                            }),);
                          }, child: Text("send"))

                        ],
                      ),

                    ),

                  ),),

              );
            } else
              return SafeArea(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
          });
  }

  _get_insurances(List<dynamic> insurancess) {
    List<String> nameInsurancess = [];
    for (var tr in insurancess) {
      nameInsurancess.add(tr.name);
    }
return nameInsurancess;
  }
}
