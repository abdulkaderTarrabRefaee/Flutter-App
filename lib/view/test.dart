
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //enable this line if you want test Dark Mode
      //theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              ///Menu Mode with no searchBox
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a country",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Menu mode *",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  AlertDialog alert = AlertDialog(
                    title: Text("Are you sure..."),
                    content: Text("...you want to clear the selection"),
                    actions: [
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      FlatButton(
                        child: Text("NOT OK"),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  );

                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                },
              ),
              Divider(),

              ///Menu Mode with overriden icon and dropdown buttons
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownSearch<String>(
                      validator: (v) => v == null ? "required field" : null,
                      hint: "Select a country",
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF01689A)),
                        ),
                      ),
                      showAsSuffixIcons: true,
                      clearButtonBuilder: (_) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.clear,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      dropdownButtonBuilder: (_) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      showSelectedItem: true,
                      items: [
                        "Brazil",
                        "Italia (Disabled)",
                        "Tunisia",
                        'Canada'
                      ],
                      label: "Menu mode *",
                      showClearButton: true,
                      onChanged: print,
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      selectedItem: "Tunisia",
                    ),
                  ),
                  Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Menu mode *",
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF01689A)),
                          ),
                        ),
                      ))
                ],
              ),
              Divider(),

              Divider(),

              ///custom itemBuilder and dropDownBuilder

              Divider(),

              ///BottomSheet Mode with no searchBox
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: ["Brazil", "Italia", "Tunisia", 'Canada', 'Zraoua', 'France', 'Belgique'],
                label: "Custom BottomShet mode",
                onChanged: print,
                selectedItem: "Brazil",
                showSearchBox: true,
                searchBoxDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: "Search a country",
                ),
                popupTitle: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              Divider(),

              ///show favorites on top list

              Divider(),

              ///merge online and offline data in the same list and set custom max Height

              Divider(),

              ///open dropdown programmatically
              DropdownSearch<String>(
                items: ["no action", "confirm in the next dropdown"],
                label: "open another dropdown programmatically",
                onChanged: (String v) {
                  if (v == "confirm in the next dropdown") {
                    _openDropDownProgKey.currentState.openDropDownSearch();
                  }
                },
              ),
              Padding(padding: EdgeInsets.all(4)),
              DropdownSearch<String>(
                key: _openDropDownProgKey,
                items: ["Yes", "No"],
                label: "confirm",
                showSelectedItem: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RaisedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState.openDropDownSearch();
                      },
                      color: Theme.of(context).accentColor,
                      child: Text("Open dropdownSearch")),
                  RaisedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            .changeSelectedItem("No");
                      },
                      child: Text("set to 'NO'")),
                  Material(
                    child: RaisedButton(
                        onPressed: () {
                          _openDropDownProgKey.currentState
                              .changeSelectedItem("Yes");
                        },
                        child: Text("set to 'YES'")),
                  ),
                  RaisedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            .changeSelectedItem("Blabla");
                      },
                      child: Text("set to 'Blabla'")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }





}