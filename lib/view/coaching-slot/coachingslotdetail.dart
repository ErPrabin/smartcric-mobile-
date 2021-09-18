import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartcric/controller/homeworkcontroller.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/util.dart';

class CoachingSlotDetail extends StatefulWidget {
  // const CoachingSlotDetail({ Key? key }) : super(key: key);
  var data;
  CoachingSlotDetail({this.data});

  @override
  _CoachingSlotDetailState createState() => _CoachingSlotDetailState();
}

class _CoachingSlotDetailState extends State<CoachingSlotDetail> {
  File selectedfile;
  String filename;
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
      // backgroundColor: kprimarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.data.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                striptags(widget.data.description),
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ktextlightcolor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Time From: '+ widget.data.timeFrom,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ktextlightcolor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Time To: '+ widget.data.timeTo,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ktextlightcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
