import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
class City
{

  final int id;
  final String name;
  final int  language_id;
  final String group_id;

  City({this.id, this.name, this.language_id, this.group_id});
  factory City.fromJson(Map<dynamic, dynamic> jsonData)
  {
    return City(
      id:jsonData['id'],
      name:jsonData["name"],
      language_id:jsonData["language_id"],
      group_id:jsonData["group_id"],
    );
  }
}
