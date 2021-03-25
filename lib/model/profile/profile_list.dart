
class ProfileList {
  final List<dynamic> profileList;
  ProfileList({this.profileList});
  factory ProfileList.fromJson(Map<String, dynamic> jsonData) {
    return ProfileList(
      profileList: jsonData['content']['datas'],
    );
  }
}
