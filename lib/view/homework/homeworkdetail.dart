import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/util.dart';

class HomeWorkDetail extends StatelessWidget {
  // const HomeWorkDetail({ Key? key }) : super(key: key);
  var data;
  HomeWorkDetail({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
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
      backgroundColor: kprimarycolor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              striptags(data.description),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ktextlightcolor),
            ),
            Padding(
              padding: const EdgeInsets.only(top:150.0),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    selectHomework();
                  },
                  child: Text('Select Homework'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
void selectHomework() async{
  FilePickerResult? result = await FilePicker.platform.pickFiles();

if(result != null) {
   File file = File(result.files.single.path);
} else {
   // User canceled the picker
}
}
