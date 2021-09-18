import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:smartcric/controller/homeworkcontroller.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:smartcric/view/coaching-slot/coachingslotdetail.dart';
import 'package:smartcric/view/homework/homeworkdetail.dart';

class CoachingSlotContainer extends StatefulWidget {
  // const CoachingSlotContainer({ Key? key }) : super(key: key);
  var data;
  CoachingSlotContainer({this.data});

  @override
  _CoachingSlotContainerState createState() => _CoachingSlotContainerState();
}

class _CoachingSlotContainerState extends State<CoachingSlotContainer> {
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
                  widget.data.title,
                  style: ktextstyle,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CoachingSlotDetail(data: widget.data)));
        },
      ),
    );
  }
}
