import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/Staff/staff.dart';
import 'package:gpluseclinicapp/model/data_gplus/data_search.dart';
import 'package:gpluseclinicapp/model/profile2/profileHos.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/appointment_view.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:gpluseclinicapp/view/detalis_dr.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  int pageNumberInc = 1;
  int pageCurrentNumber;
  //max-3 get yarin
  int maxNumberPage;
  int maxNumberResult;
  List<bool> pageSelected;
  int parntid ;
  void incPage() {
    if (pageSelected[0] == true && pageNumberInc > 1) {
      pageNumberInc--;
    }
    if (pageSelected[1] == true && pageNumberInc < maxNumberPage) {
      pageNumberInc++;
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black12,
            onTap: (index) {
              if(index==2)
                setState(() {
                  Stream.fromFuture(GplusApi().fetchProfileHosData(
                      widget.hospitalDoctorClinic, widget.hospitalDoctorClinic.type))
                      .listen((event) {
                    parntid=event.profile.datas.first.parentId;
                    print(parntid);
                    return (event.profile.datas.first.parentId);
                  });
                });
            },
            tabs: [
              Tab(icon: Icon(Icons.local_hospital)),
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.rate_review)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),

          title: Text("Hospital Data"),
        ),

        body: TabBarView(children: [
          FutureBuilder<ProfileHos>(
              future: GplusApi().fetchProfileHosData(
                  widget.hospitalDoctorClinic,
                  widget.hospitalDoctorClinic.type),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  parntid = snapshot.data.profile.data.parentId;
                  initState();
                  print(parntid);
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
                  return GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(snapshot.data.gallery.datas.length,
                        (index) {
                      GalleryData asset = snapshot.data.gallery.datas[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: urlImage + asset.image,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
          FutureBuilder<Staff>(
              future: GplusApi().fetchStaffData(parntid, 2, 1, ""),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  var maxNumberPage = snapshot.data.totalPage;
                  var pageCurrentNumber = snapshot.data.pageNumber;
                  return Column(
                    children: [
                      Text("data"),
                      Expanded(

                        child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.staffData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return cardItem(
                                  context,
                                  snapshot.data.staffData.toList()[index],
                                  widget.typeSelected);
                            }),
                      ),
                      Text("sd")
                    ],
                  );
                } else
                  return SafeArea(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.red),
                      ),
                    ),
                  );
              }),
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
                image: ExactAssetImage('assets/tamas.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}

Widget _getImage(url) {
  final imageProvider = ResizeImage.resizeIfNeeded(
    200,
    250,
    CachedNetworkImageProvider(
      url,
    ),
  );

  final image = Image(
    image: imageProvider,
  );

  return image;
}

Widget cardItem(
    BuildContext context, StaffData staff, List<bool> typeSelected) {
  String urlImage = "https://gplusclinic.com/images/upload/";
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        hoverColor: Colors.red,
        child: Container(
          height: 250,
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 140,
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _getImage(urlImage + staff.image),
                          ),
                        ),
                        if (staff.isFreeConsultation)
                          Transform.translate(
                            offset: Offset(-20, -23.0),
                            child: Container(
                              width: 100,
                              height: 14,
                              color: Color.fromRGBO(75, 182, 255, 0.6),
                              child: Center(
                                child: Text(
                                  "FREE CONSULTATION",
                                  style: TextStyle(fontSize: 8),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                    if (staff.isAward)
                      Transform.rotate(
                        angle: -22 / 7 / 6,
                        child: Container(
                          width: 60,
                          child: Image.network(
                              "https://gplusclinic.com/assets/img/avard-mini.png"),
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.black,
                  ),
                  Container(
                    width: 190,
                    height: 20,
                    alignment: Alignment.topLeft,
                    child: Text(
                      staff.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                  Row(
                    children: [
                      Text(staff.rate.toString(),
                          style: TextStyle(fontSize: 7)),
                      Container(
                        child: RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: staff.rate.toDouble(),
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 10,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                      "from " +
                          staff.rateCount.toString() +
                          "  verified reviews ",
                      style: TextStyle(fontSize: 6)),
                  Container(
                    width: 180,
                    height: 100,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(staff.summary == null ? "" : staff.summary,
                        style: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          print(staff.name);
          print(typeSelected);
        },
      ),
      Container(
        height: 100,
        width: 10,
        padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      ),
    ],

    // child: Center(child: Text(hospitalDoctorClinic.name)),
  );
}

void _showResultSearchDoc(BuildContext context,
    HospitalDoctorClinic hospitalDoctorClinics, typeSelected) {
  print(typeSelected);
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return new DetailedProfileDoc(hospitalDoctorClinics, typeSelected);
  }));
}

void _showResultSearchHos(BuildContext context,
    HospitalDoctorClinic hospitalDoctorClinics, typeSelected) {
  print(typeSelected);
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return new DetailedProfileHos(hospitalDoctorClinics, typeSelected);
  }));
}
