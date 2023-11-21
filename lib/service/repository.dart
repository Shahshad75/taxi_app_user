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

  static Future<List<Map<String, dynamic>>> booking(
      piclat, piclong, endlat, endlong) async {
    var url = 'http://10.0.2.2:8080/booking/ride';
    var header = {"Content-Type": "application/json"};
    var body = {
      "userid": 2,
      "pickuplat": piclat,
      "pickuplong": piclong,
      "droppofflat": endlat,
      "dropofflong": endlong,
      "status": "pending"
    };
//  "pickuplat": 37.4219983,babu
//       "pickuplong": -122.084,
//       "droppofflat": 37.5219983,
//       "dropofflong": -121.984,
    var uri = Uri.parse(url);
    final response =
        await http.post(uri, body: jsonEncode(body), headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey("success")) {
        List<dynamic> driversList = jsonResponse["success"];
        List<Map<String, dynamic>> driversInfoList =
            List<Map<String, dynamic>>.from(driversList);
        return driversInfoList;
      } else {
        print("Error: 'success' key not found in the response");
        return [];
      }
    } else {
      print("Error: ${response.statusCode}");
      return [];
    }
  }
}
