
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartcric/controller/authcontroller.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  // const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final userp = Provider.of<AuthController>(context);
    var size = MediaQuery.of(context).size;

    return Consumer<AuthController>(builder: (context, loginerror, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.blue,
                        height: 150,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Text('Smart Cric',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 44,
                                  color: Colors.orange)),
                        ),
                        // Image.asset("assets/images/kothakhojlogo.png"),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: 350,
                        // height: 370
                        // color: Colors.blue,
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Let's get started ",
                          style:
                              // GoogleFonts.notoSans(
                              //     textStyle: TextStyle(fontSize: 20))
                              TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 350,
                        // height: 370
                        // color: Colors.blue,
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.orange),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            (() {
                              if (loginerror.loginerror == null) {
                                return '';
                              } else {
                                return loginerror.loginerror.error;
                              }
                            }()),
                            style: TextStyle(fontSize: 18,color: Colors.red),
                          ),
                        ),
                      ),
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
                                SizedBox(height: 20,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: 'Password',
                                  ),
                                  obscureText: true,
                                  validator: (val) => val.length < 8
                                      ? 'Password must be atleast 8 character long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                                SizedBox(height: 20,),

                                RaisedButton(
                                    // elevation: 0.0,
                                    child: Container(
                                      width: 350,
                                      height: 40.0,
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    color: Colors.blue,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        // AuthController().login(email,password);
                                        // userp.login('prabin');
                                        EasyLoading.show(
                                            status: 'Loggin You In...',
                                            maskType: EasyLoadingMaskType.black);
                                        userp
                                            .login(email, password)
                                            .then((value) {
                                          EasyLoading.dismiss();
                                        });
                                      }
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  child: Text('Forget Password?'),
                                  onTap: () {
                                    print('forget password');
                                    Navigator.of(context)
                                        .pushNamed('/forgetpassword');
                                  },
                                )
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
        ),
      );
    });
  }
}
