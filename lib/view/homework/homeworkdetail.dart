import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:smartcric/controller/homeworkcontroller.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/util.dart';

class HomeWorkDetail extends StatefulWidget {
  // const HomeWorkDetail({ Key? key }) : super(key: key);
  var data;
  HomeWorkDetail({this.data});

  @override
  _HomeWorkDetailState createState() => _HomeWorkDetailState();
}

class _HomeWorkDetailState extends State<HomeWorkDetail> {
  File selectedfile;
  String filename;
  @override
  Widget build(BuildContext context) {
    void selectHomework() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        selectedfile = File(result.files.single.path);
        print(selectedfile.path);
        setState(() {
          selectedfile = selectedfile;
        });
      } else {
        print('User canceled the picker');
      }
    }

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
              widget.data.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              striptags(widget.data.description),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ktextlightcolor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                    child: RaisedButton.icon(
                  onPressed: () {
                    selectHomework();
                  },
                  icon: Icon(Icons.folder_open),
                  label: Text("CHOOSE FILE"),
                  color: Colors.redAccent,
                  colorBrightness: Brightness.dark,
                )),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Center(
            //     child: Text(selectedfile.path ?? 'Select Homework '),
            //   ),
            // ),
            selectedfile == null
                ? Container()
                : Center(
                  child: Container(
                      child: RaisedButton.icon(
                      onPressed: () {
                        HomeworkController.submitHomework(selectedfile);
                      },
                      icon: Icon(Icons.folder_open),
                      label: Text("UPLOAD FILE"),
                      color: Colors.redAccent,
                      colorBrightness: Brightness.dark,
                    )),
                )
            // Padding(
            //   padding: const EdgeInsets.only(top: 150.0),
            //   child: Center(
            //     child: RaisedButton(
            //       onPressed: () {
            //         print(selectedfile);
            //         HomeworkController.submitHomework(selectedfile);
            //       },
            //       child: Text('Submit Homework'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
