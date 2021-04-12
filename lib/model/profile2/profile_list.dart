
class ProfileList {
  final dynamic profileList;
  ProfileList({this.profileList});
  factory ProfileList.fromJson(Map<dynamic, dynamic> jsonData) {
    return ProfileList(
      profileList: jsonData['profile']['data'],
    );
  }
}
