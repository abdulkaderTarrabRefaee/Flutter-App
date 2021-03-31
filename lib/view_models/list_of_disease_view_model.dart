import 'package:flutter/cupertino.dart';
import 'package:gpluseclinicapp/model/disease/disease.dart';
import 'package:gpluseclinicapp/service/gplusapi.dart';

class DiseaseListViewModel extends ChangeNotifier {
  List<Disease> _diseaseList = [];
  fetchDisease() async {
    _diseaseList = await GplusApi().fetchDisease();
    notifyListeners();
  }

  List<Disease> get diseaseList => _diseaseList;
}
