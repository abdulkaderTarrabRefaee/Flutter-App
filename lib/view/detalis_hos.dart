import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/profile2/profileHos.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/appointment_view.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:photo_view/photo_view.dart';

import 'package:cached_network_image/cached_network_image.dart';
class DetailedProfileHos extends StatefulWidget {
  HospitalDoctorClinic hospitalDoctorClinic;
  List<bool> typeSelected;

  DetailedProfileHos(this.hospitalDoctorClinic, this.typeSelected, {Key key})
      : super(key: key);
  @override
  _DetailedProfileHosState createState() => _DetailedProfileHosState();
}

class _DetailedProfileHosState extends State<DetailedProfileHos> {
  String urlImage = "https://gplusclinic.com/images/upload/";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black12,
            onTap: (index) {},
            tabs: [
              Tab(icon: Icon(Icons.local_hospital)),
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.rate_review)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          title: Text("snapshot.data.profile.data.name"),
        ),
        body: TabBarView(children: [
          FutureBuilder<ProfileHos>(
              future: GplusApi().fetchProfileHosData(
                  widget.hospitalDoctorClinic,
                  widget.hospitalDoctorClinic.type),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SafeArea(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              width: MediaQuery.of(context).size.width - 80,
                              alignment: Alignment.topCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(urlImage +
                                    snapshot.data.profile.data.image),
                              ),
                            ),
                            if (snapshot.data.profile.data.content != null)
                              Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15, right: 15),
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
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
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 15,
                                        right: 15),
                                    width:
                                        MediaQuery.of(context).size.width - 10,
                                    alignment: Alignment.topCenter,
                                    child: Html(
                                        data:
                                            snapshot.data.profile.data.content,
                                        style: {
                                          'h2': Style(
                                            color: Colors.black,
                                            fontSize: FontSize.large,
                                          ),
                                          'p': Style(
                                              color: Colors.black87,
                                              fontSize: FontSize.xxSmall),
                                          'h3': Style(
                                              color: Colors.black87,
                                              fontSize: FontSize.xxSmall),
                                          'h4': Style(
                                              color: Colors.black87,
                                              fontSize: FontSize.xxSmall),
                                          'div': Style(
                                              color: Colors.black87,
                                              fontSize: FontSize.small),
                                        })),
                              ),
                            if (snapshot.data.profile.data.expertise != null)
                              Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15, right: 15),
                                width: 350,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
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
                                  child: Center(
                                      child: Text(snapshot
                                          .data.profile.data.expertise
                                          .toString())),
                                ),
                              ),
                            if (snapshot.data.profile.data.languages != null)
                              Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15, right: 15),
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
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
                                  child: Center(
                                      child: Text(snapshot
                                          .data.profile.data.languages
                                          .toString())),
                                ),
                              ),
                            if (snapshot.data.profile.data.units != null)
                              Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15, right: 15),
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
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
                                  child: Center(
                                      child: Text(snapshot
                                          .data.profile.data.units
                                          .toString())),
                                ),
                              ),
                            if (snapshot.data.profile.data.units != null)
                              Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15, right: 15),
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
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
                                  child: Center(
                                      child: Text(snapshot
                                          .data.profile.data.units
                                          .toString())),
                                ),
                              ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) {
                                      return new AppointmentView(
                                          snapshot.data.profile.data);
                                    }),
                                  );
                                },
                                child: Text("send"))
                          ],
                        ),
                      ),
                    ),
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
              }),
          FutureBuilder<ProfileHos>(
              future: GplusApi().fetchProfileHosData(
                  widget.hospitalDoctorClinic,
                  widget.hospitalDoctorClinic.type),
              builder: (context, snapshot) {

                if (snapshot.hasData) {

                  return  GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(snapshot.data.gallery.datas.length, (index) {
                        GalleryData  asset = snapshot.data.gallery.datas[index];
                     return
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CachedNetworkImage(
                           imageUrl: urlImage+asset.image,
                           imageBuilder: (context, imageProvider) => Container(
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: imageProvider,
                                   fit: BoxFit.cover,),
                             ),
                           ),
                           placeholder: (context, url) => Padding(
                             padding: const EdgeInsets.all(18.0),
                             child: CircularProgressIndicator(),
                           ),
                           errorWidget: (context, url, error) => Icon(Icons.error),
                         ),
                       );
                      }),

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
              }),
          Text("dd"),
          Text("dd"),
        ]),
      ),
    );
  }
}
class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/tamas.jpg'),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}