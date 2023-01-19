import 'dart:developer';
import 'package:flutter_widgetbook/config/constants.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        //List<UserModel> model = userModelFromJson(response.body);
        //return model;
        //return response
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
