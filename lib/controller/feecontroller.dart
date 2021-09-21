import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcric/model/coachingslot.dart';
import 'package:smartcric/model/myactivity.dart';
import 'package:smartcric/util.dart';

class FeeController {
  static var client = http.Client();

  static Future<dynamic> payFee(
      String cnumber, String expmonth, String expyear, String cvc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(expyear);

    var response = await client.post(
      Uri.parse(BaseUrl().url + 'pay-fee'),
      body: {
        'card_number': cnumber,
        'expiry_month': expmonth,
        'expiry_year': expyear,
        'cvc': cvc
      },
      headers: {
        "Authorization": 'Bearer ' + prefs.getString('token'),
        'key': 'application/json',
      },
    );
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      return data;
    } else
      return data;
  }
}
