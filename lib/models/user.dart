import 'dart:convert';

/*  List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
 */
class UserModel {
  final String displayName;
  final String email;
  final String password;
  final String uid;

  UserModel({
    required this.displayName,
    required this.email,
    required this.password,
    required this.uid,
  });

  /* UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['password'] = password;

    return data;
  } */
}
