import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartcric/model/homework.dart';
import 'package:smartcric/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:provider/provider.dart';

class HomeworkController extends ChangeNotifier {
  static var client = http.Client();
  String message = "Downloading PDF...";

  static Future<List<Homework>> fetchHomeworks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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

  downloadHomework(id, name) async {
    print(id);
    var dio = new Dio();
    final dirList = await _getExternalStoragePath();
    final path = dirList[0].path;
    final file = File('$path/smart' + '.pdf');
    print(file.path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers["Authorization"] = "Bearer " + prefs.getString('token');
    await dio
        .download(
            BaseUrl().url + 'download-homework/' + id.toString(), file.path)
        .then((value) {
      message = "Download Completed...";
      print(message);
      notifyListeners();
    });
  }

  Future<List<Directory>> _getExternalStoragePath() {
    return p.getExternalStorageDirectories(type: p.StorageDirectory.documents);
  }
}
