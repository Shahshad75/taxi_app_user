import 'dart:convert';

import 'package:taxi_app_user/service/user.dart';
import 'package:http/http.dart' as http;

import '../utils/app_endpoint.dart';

class Repo {
  static Future<int?> userSignUp(User user) async {
    var url = Url.baseUrl + Url.signUpUser;
    final uri = Uri.parse(url);
    final body = user.toJson();
    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    if (response.statusCode == 200) {
      int id = jsonDecode(response.body);
      return id;
    }
    return null;
  }

  static Future<User?> userSignin(String email, String password) async {
    var url = Url.baseUrl + Url.signInUser;
    final uri = Uri.parse(url);
    final body = {"email": email, "password": password};

    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      User user = User.fromJson(responseData['user']);
      return user;
    } else {
      return null;
    }
  }
}
