
import 'package:flutter/material.dart';
import 'package:gpluseclinicapp/model/city/city.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  City  dropdownCitySelected ;

  @override
  void initState() {
    super.initState();
    Provider.of<CityListViewModel>(context, listen: false)
        .fetchCity();
  }

  Widget _buildList(CityListViewModel vs) {
   return Center(
     child: Text(vs.citiesList.length.toString()),
   );
  }
  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<CityListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
       title:  _buildList(vs),
      ),
      body: SafeArea(
       child: Center(
    child:  Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children:<Widget> [
          DropdownButton<City>(
            isExpanded: true,
            hint: Text("Select City"),
            value: dropdownCitySelected,
            items: vs.citiesList.map((City ct){
              return DropdownMenuItem<City>(
                  value: ct,
                  child: Text(ct.name));
            }).toList(),
            onChanged:(City ct )
            {
              setState(() {
                dropdownCitySelected = ct;
              });
            },
          )
        ],
      ),
    ),
    )),
    );
  }
}