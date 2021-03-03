import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';
import 'package:gpluseclinicapp/view/hom_view.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gplusclinic',
    home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState()
  {
    super.initState();
    var prov= Provider.of<CityListViewModel>(context,listen: false);

  }

  @override
  Widget build(BuildContext context) {
    City selectedValue;
    List<City> citis;
    var prov= Provider.of<CityListViewModel>(context,listen: false);

    return ChangeNotifierProvider<CityListViewModel>(

        create: (context) => CityListViewModel(),
        child: MaterialApp(
            home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("gplusclinic",style: TextStyle(fontSize: 14))
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children:<Widget> [
            DropdownButton<City>(

              isExpanded: true,
                hint: Text(prov.citiesList.length.toString()),
                value: selectedValue,
                items: citis.map((City ct){
                  return DropdownMenuItem<City>(
                    value: ct,
                      child: Text("dsa"));
                }).toList(),



            )

          ],
        ),
      ),
    )
    )
    );
  }
}
