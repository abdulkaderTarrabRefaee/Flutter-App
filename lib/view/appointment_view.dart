import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Io;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpluseclinicapp/model/appointment/Appointment.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AppointmentView extends StatefulWidget {
  dynamic profileData;
  AppointmentView(this.profileData);

  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  List<String> filePicker = [];
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final messageController = TextEditingController();
  final emailController = TextEditingController();
  PlatformFile file;
  bool fileIsUp = false;
  FilePickerResult result;
  DateTime now = DateTime.now();
  FToast fToast;
  String filename;
  Future<http.Response> cas;
  List<String> selectTreatments;
  String selectTreatmentsid = "";

  @override
  // ignore: must_call_super
  void initState() {
    filename = "";
    filePicker = [];
    fileIsUp = false;
    if (widget.profileData.insurances!=null) {
      for (var tr in widget.profileData.insurances)
        selectTreatments = [tr.name];
    }
    else
      selectTreatments=["no","yes"];
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-ddTHH:mm').format(now);
    print(formattedDate);
    print(widget.profileData.units);
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Builder(
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("dddata"),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "name", icon: Icon(Icons.person)),
                      controller: nameController,
                    ),
                  ),
                  //numberController
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "phone", icon: Icon(Icons.phone)),
                      keyboardType: TextInputType.number,
                      controller: numberController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownSearch<String>(
                      validator: (v) => v == null ? "required field" : null,
                      hint: "Select a country",
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: widget.profileData.units,
                      label: "Menu mode *",
                      showClearButton: true,
                      onChanged: (value) {
                        selectTreatmentsid = value;
                        print(selectTreatmentsid);
                      },
                      selectedItem: selectTreatmentsid,
                    ),
                  ),
                  //emailController
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "email", icon: Icon(Icons.email)),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                  ),
                  Divider(),
                  //messageController
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "message", icon: Icon(Icons.message)),
                      controller: messageController,
                    ),
                  ),
                  InkWell(
                    child: Center(
                        child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.blue,
                      child: Text("Upload File"),
                    )),
                    onTap: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        PlatformFile file = result.files.first;
                        final bytes = Io.File(file.path).readAsBytesSync();
                        filePicker.add(base64Encode(bytes));

                        setState(() {
                          fileIsUp = true;
                          filename = result.files.first.name;
                        });
                      } else {
                        Fluttertoast.showToast(
                            msg: "Upload error",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  ),
                  if (fileIsUp)
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.upload_file,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                        Text(filename),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 20.0,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              fileIsUp = false;
                              filename = "";
                              filePicker = null;
                              initState();
                            });
                          },
                        ),
                      ],
                    ),
                  Center(
                    child: RaisedButton(
                      color: Colors.pink,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          AppointmentPost appointmentPost = new AppointmentPost(
                              fileBase64: filePicker,
                              createDate: formattedDate,
                              status: 0,
                              date: formattedDate,
                              fullPhone: numberController.text,
                              id: 0,
                              mail: emailController.text,
                              memberId: 0,
                              message: messageController.text,
                              name: nameController.text,
                              parentId: widget.profileData.parentId,
                              phone: numberController.text,
                              profileLink: widget.profileData.link,
                              staffId: 0,
                              staffName: null,
                              treatments: [
                                "da2c8a80-2374-439c-826a-0daa53e68d22",
                                "4f3c3f30-5413-485b-bdf4-cc2b2f6b9242",
                                "e7280db2-e646-43d8-aedd-e6d74f35af12"
                              ],
                              type: widget.profileData.type,
                              unitId: "0");
                          GplusApi().appointmentPost(appointmentPost);
                          Fluttertoast.showToast(
                              msg: "Sent  succesfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          initState();
                        });
                        final snackBar =
                            SnackBar(content: Text('Are you talkin\' to me?'));
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Send')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
