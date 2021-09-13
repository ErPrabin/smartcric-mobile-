import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:smartcric/controller/homeworkcontroller.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:smartcric/view/homework/homeworkdetail.dart';

class HomeWorkContainer extends StatefulWidget {
  // const HomeWorkContainer({ Key? key }) : super(key: key);
  var data;
  HomeWorkContainer({this.data});

  @override
  _HomeWorkContainerState createState() => _HomeWorkContainerState();
}

class _HomeWorkContainerState extends State<HomeWorkContainer> {
  HomeworkController homework = new HomeworkController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        child: Container(
          color: Colors.white,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data.name,
                  style: ktextstyle,
                ),
                InkWell(
                    child: Icon(Icons.download),
                    onTap: () {
                      EasyLoading.show(
                          status: "Downloading Homework...",
                          maskType: EasyLoadingMaskType.black);
                      print('download');
                      homework
                          .downloadHomework(widget.data.id, widget.data.name)
                          .then((value) {
                        EasyLoading.showSuccess('Download Success!');
                        EasyLoading.dismiss();
                      });
                    }),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeWorkDetail(data: widget.data)));
        },
      ),
    );
  }
}
