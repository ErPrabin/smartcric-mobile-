import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartcric/model/homework.dart';
import 'package:smartcric/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as p;

class HomeworkController {
  static var client = http.Client();

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
    final file = File('$path/$name' + '.pdf');
    print(file.path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers["Authorization"] = "Bearer " + prefs.getString('token');
    var res = await dio.download(
        BaseUrl().url + 'download-homework/' + id.toString(), file.path);
    print(res);
    // await client.get(Uri.parse(BaseUrl().url + 'download-homework/1'), headers: {
    //   "Authorization": 'Bearer ' + prefs.getString('token'),
    //   "Content-Type": "application/pdf",
    //   "Accept": "application/pdf",
    //   'Connection': "keep-alive"
    // });
  }

  Future<List<Directory>> _getExternalStoragePath() {
    return p.getExternalStorageDirectories(type: p.StorageDirectory.documents);
  }
}
