import 'dart:ui';

import 'package:smartcric/controller/authcontroller.dart';
import 'package:smartcric/view/auth/login.dart';
import 'package:smartcric/view/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  //  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Token().deletetoken();
    // if (Token().gettoken() == null) {
      // print(Token().gettoken());
      // final p = Provider.of<AuthController>(context);
      // print(p);
      return  Consumer<AuthController>(
      builder: (context, user, child) {
        // return Text(user.user[0].token);
        // print(user.user);
        if(user.user.length==0){
        print('login');
        print(user.user.length);


          return LogIn();
        }
        else 
        {
        print(user.user.length);
          return HomePage();


        }
        
      },
    )
      ;
    // } else {
    //   return LogIn();
    // }
  }
}
