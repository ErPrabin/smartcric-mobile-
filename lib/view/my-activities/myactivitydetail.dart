import 'package:flutter/material.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/util.dart';

class MyActivityDetail extends StatelessWidget {
  // const MyActivityDetail({ Key? key }) : super(key: key);
  var data;
  MyActivityDetail({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: kprimarycolor,
        elevation: 0,
        // centerTitle: true,
        // title: Text('Homework',
        //     style: TextStyle(
        //         fontWeight: FontWeight.w900, fontSize: 24, color: kwhitetext)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Name: ",
                    style: ktextstyle,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    data.name,
                    style: ktextstyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  // Text(
                  //   "Description: ",
                  //   style: ktextstyle,
                  // ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Expanded(
                      child: Text(
                    striptags(data.description),
                    style: kdescriptionystyle,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
