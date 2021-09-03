import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartcric/model/homework.dart';
import 'package:smartcric/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeworkController {
  static var client = http.Client();

  static Future<List<Homework>> fetchHomeworks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('homework');

    var response =
        await client.get(Uri.parse(BaseUrl().url + 'homework'), headers: {
      "Authorization": 'Bearer ' + prefs.getString('token'),
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Connection': "keep-alive"
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return homeworkFromJson(jsonString);
    } else
      return null;
  }
}
