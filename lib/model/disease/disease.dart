
class Disease {
  int id;
  String name;
  bool active;
  int language_id;
  String group_id;
  int doctor_id;

  Disease({this.id, this.name, this.active, this.language_id, this.group_id,
      this.doctor_id});
  factory Disease.fromJson(Map<dynamic, dynamic> jsonData)
  {
    return Disease(
        id:jsonData['id'],
        name:jsonData["name"],
        active:jsonData["active"],
        language_id:jsonData["language_id"],
        group_id:jsonData["group_id"],
        doctor_id:jsonData["doctor_id"]
    );
  }

}
