import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smartcric/controller/authcontroller.dart';
import 'package:smartcric/helper/constants.dart';

class HomePage extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userp = Provider.of<AuthController>(context);

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    List toolkit = ['Homework', 'My Activities', 'Coaching Slots', 'Pay Fee'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        centerTitle: true,
        elevation: 0,
        title: Text('SmartCric',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 24, color: kwhitetext)),
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
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              userp.logout();
            },
          )
        ],
      ),
      backgroundColor: kprimarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height,
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / (itemHeight * 0.5)),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(toolkit.length, (index) {
                  return InkWell(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        toolkit[index],
                        style: ktextstyle,
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/' + toolkit[index].toLowerCase());
                    },
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
