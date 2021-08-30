import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartcric/helper/constants.dart';

class HomePage extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('K-Variety',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: kprimarycolor)),
        leading: IconButton(
          iconSize: 18,
          icon: Container(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: ktextlightcolor,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
