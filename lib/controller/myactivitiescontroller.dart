import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcric/model/myactivity.dart';
import 'package:smartcric/util.dart';


class MyActivityController {
  static var client = http.Client();

  static Future<List<MyActivity>> fetchMyActivity(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response =
        await client.get(Uri.parse(BaseUrl().url + 'videos/$category'), headers: {
      "Authorization": 'Bearer ' + prefs.getString('token'),
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Connection': "keep-alive"
    });
    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      return myActivityFromJson(jsonString);
    } else
      return null;
  }

}