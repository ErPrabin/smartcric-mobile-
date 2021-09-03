import 'package:smartcric/controller/authcontroller.dart';
import 'package:smartcric/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:smartcric/view/forgetpassword/forgetpassword.dart';
import 'package:smartcric/view/homework/index.dart';
import 'package:smartcric/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Future<String> getUserToken()=> Token().gettoken();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthController()),
          // ChangeNotifierProvider(create: (_) => CartController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/forgetpassword': (context) => ForgetPassword(),
            '/homework': (context) => HomeWork(),
            // '/food_detail': (context) => FoodDetail(),
            // '/cartpage': (context) => CartPage(),
            
          },
          // home: Wrapper(),

          // FutureBuilder(
          //   future: getUserToken(),
          //   builder: (context,snapshot){
          //     if(snapshot.hasError){
          //       return Text('Error Occured');
          //     }
          //     else if (snapshot.data==null){
          //      return LogIn();
          //     }
          //     else {
          //       Token().deletetoken();
          //       return Homepage();
          //     }

          //   }),
        ));
  }
}
