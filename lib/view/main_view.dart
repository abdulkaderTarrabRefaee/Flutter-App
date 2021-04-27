import 'package:flutter/material.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/model/profile2/profileDoc.dart';
import 'package:gpluseclinicapp/view/appointment_view.dart';
import 'package:gpluseclinicapp/view/search_view.dart';
void main() => runApp(MainView());

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;


  get dropdownCitySelected => null;
  get dropdownDiseaseSelected => null;
  ProfileData profile =new ProfileData(
    type: 2,
    parentId: 120,
    link: "/",

  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [const Color(0xFF00a99d), const Color(0xFF29abe2)],
                  transform: GradientRotation(35.0))),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              width:  MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image(width: 250,
                      image: AssetImage(
                          'images/logo.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  _getSearch(context,dropdownCitySelected,dropdownDiseaseSelected,[false,true,false,false]);
                                },
                                child: Container(
                                    width: 155,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFF29abe2),
                                          const Color(0xFF00a99d)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FontAwesomeIcons.userNurse,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Find a Doctor",
                                            style: TextStyle(
                                                color:  Colors.white,
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  _getSearch(context,dropdownCitySelected,dropdownDiseaseSelected,[false,false,true,false]);
                                },
                                child: Container(
                                    width: 155,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFF29abe2),
                                          const Color(0xFF00a99d)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FontAwesomeIcons.hospital,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Find a Hospital",
                                            style: TextStyle(
                                                color:  Colors.white,
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  _getSearch(context,dropdownCitySelected,dropdownDiseaseSelected,[false,false,false,true]);
                                },
                                child: Container(
                                    width: 155,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFF29abe2),
                                          const Color(0xFF00a99d)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FontAwesomeIcons.clinicMedical,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Find a Clinic",
                                            style: TextStyle(
                                                color:  Colors.white,
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) {
                                    return new AppointmentView(
                                        profile);
                                  }),
                                );
                              },
                                child: Container(
                                    width: 155,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFF29abe2),
                                          const Color(0xFF00a99d)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FontAwesomeIcons.book,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Book Appointment",
                                            style: TextStyle(
                                                color:  Colors.white,
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              MainView()));
                                },
                                child: Container(
                                    width: 155,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFF29abe2),
                                          const Color(0xFF00a99d)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "About US ",
                                            style: TextStyle(
                                                color:  Colors.white,
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              MainView()));
                                },
                                child: Container(
                                    width: 155,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF76b8bd),
                                            spreadRadius: 1),
                                      ],
                                      gradient: LinearGradient(
                                        stops: [
                                          0,
                                          1,
                                        ],
                                        begin: Alignment(0, 0),
                                        end: Alignment(0, -1),
                                        colors: [
                                          const Color(0xFF29abe2),
                                          const Color(0xFF00a99d)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Contact US",
                                            style: TextStyle(
                                                color:  Colors.white,
                                                fontFamily: 'Tahoma',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image(width: 350,
                      image: AssetImage(
                          'images/how.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.easeInCirc,
          backgroundColor: const Color(0xFF00a99d),
          selectedIndex: _selectedIndex,
          animationDuration: const Duration(milliseconds: 170),
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.white,
              inactiveColor: const Color(0xffe8e8e8),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              inactiveColor: const Color(0xffe8e8e8),
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              inactiveColor: const Color(0xffe8e8e8),
              icon: Icon(Icons.highlight),
              title: Text('Highlights'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              inactiveColor: const Color(0xffe8e8e8),
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),

          ],
        ),
    );
  }
}
void _getSearch(BuildContext context, dropdownCitySelected,
    dropdownDiseaseSelected, typeSelected) {
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return new SearchView(
        dropdownCitySelected, dropdownDiseaseSelected, typeSelected);
  }));
}
