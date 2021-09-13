import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartcric/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:smartcric/model/loginerror.dart';
import 'package:smartcric/util.dart';

class AuthController extends ChangeNotifier {
  static var client = http.Client();
  List<User> user = [];
  Loginerror loginerror = null;
  String username;

  // String _name='login';

  // login(name){
  //   _name=name;
  //   notifyListeners();

  // }
  // String  getuser(){
  //   return _name;
  // }

  Future<String> login(String email, String password) async {
    print(BaseUrl().url);
    // String email=email;
    // String password=password;
    var response = await client.post(Uri.parse(BaseUrl().url + 'login'),
        body: {'email': email, 'password': password},
        headers: {'key': 'application/json'});
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var userdata = userFromJson(jsonString);
      // print(userdata.user.name);
      user.add(userdata);
      print(user[0].user);
      print(user.toString());
      // user.add(userdata);
      // notifyListeners();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', userdata.user.id.toString());
      prefs.setString('name', userdata.user.name);
      prefs.setString('email', userdata.user.email);
      prefs.setString('token', userdata.token);
      username = prefs.getString('name');
      notifyListeners();
      print(prefs.getString('name'));
      return username;
      // return productFromJson(jsonString);
    } else {
      // print(response.body);
      // print('error');

      var jsonString = response.body;
      loginerror = loginerrorFromJson(jsonString);
      notifyListeners();

      print(loginerror.error);
      // return null;
    }
  }

  logout() {
    // print(user[0].user);
    print('logout');
    user.clear();
    loginerror = null;
    // this.token='';
    // print(token);
    notifyListeners();
  }
}
