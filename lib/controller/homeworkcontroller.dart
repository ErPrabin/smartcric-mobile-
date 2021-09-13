import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:smartcric/model/homework.dart';
import 'package:smartcric/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class HomeworkController{
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

   Future<String>  downloadHomework(id, name) async {
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
      return message;
    });
  }

  static submitHomework(File selectedfile) async {
    var dio = new Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(selectedfile.path);

    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedfile.path,
          filename: basename(selectedfile.path)
          //show only filename from path
          ),
      "homework_id": 1,
      "user_id": prefs.getString('id')
    });
    dio.options.headers["Authorization"] = "Bearer " + prefs.getString('token');
    var response =
        await dio.post(BaseUrl().url + 'store-homework', data: formdata);
    // var response = await client.post(
    //   Uri.parse(BaseUrl().url + 'store-homework'),
    //   body: formdata,
    //   headers: {
    //     "Authorization": 'Bearer ' + prefs.getString('token'),
    //     'Accept': 'application/json'
    //   },
    // );
    if (response.statusCode == 200) {
      var jsonString = response.data;
      // return homeworkFromJson(jsonString);
      print(jsonString);
    } else
      return null;
  }

  Future<List<Directory>> _getExternalStoragePath() {
    return p.getExternalStorageDirectories(type: p.StorageDirectory.documents);
  }
}
