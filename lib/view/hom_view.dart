
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpluseclinicapp/view_models/list_of_city_view_model.dart';
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await Provider.of<CityListViewModel>(context, listen: false)
                .fetchCity();
            print(Provider.of<CityListViewModel>(context, listen: false)
                .citiesList);
          },
        ),
      ),
    );
  }
}
