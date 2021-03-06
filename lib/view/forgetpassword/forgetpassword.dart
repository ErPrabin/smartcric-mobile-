import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smartcric/controller/authcontroller.dart';
import 'package:smartcric/helper/constants.dart';

class ForgetPassword extends StatefulWidget {
  // const ForgetPassword({ Key ? key }) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 50),

                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Forgot your password?',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: klogincolor),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Container(
                  //   child: Text((() {
                  //     if (loginerror.loginerror == null) {
                  //       return '';
                  //     } else {
                  //       return loginerror.loginerror.error;
                  //     }
                  //   }())),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Email',
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter Email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                                // elevation: 0.0,
                                child: Container(
                                  width: 350,
                                  height: 40.0,
                                  child: Center(
                                    child: Text(
                                      "Send Reset Link",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                color: Colors.blue,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    EasyLoading.show(
                                        // status: "Fee Payment",
                                        maskType: EasyLoadingMaskType.black);
                                    AuthController.forgetPassword(email)
                                        .then((data) {
                                      if (data['status'] == 1) {
                                        EasyLoading.showSuccess(
                                            data['message']);
                                      } else {
                                        EasyLoading.showError(data['message']);
                                      }
                                      EasyLoading.dismiss();
                                    });
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
