import 'package:flutter/material.dart';
import 'package:smartcric/controller/coachingslotcontroller.dart';
import 'package:smartcric/controller/homeworkcontroller.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/model/coachingslot.dart';
import 'package:smartcric/model/homework.dart';
import 'package:smartcric/view/homework/component/homeworkcontainer.dart';

import 'component/coachingslotcontainer.dart';

class CoachingSlot extends StatefulWidget {
  // const HomeWork({ Key? key }) : super(key: key);

  @override
  _CoachingSlotState createState() => _CoachingSlotState();
}

class _CoachingSlotState extends State<CoachingSlot> {
  Future<List<Coachingslot>> coachingslot;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coachingslot = CoachingSlotController.fetchCoachingSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        elevation: 0,
        centerTitle: true,
        title: Text('Coaching Slot',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 24, color: kwhitetext)),
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
      body: FutureBuilder(
        future: coachingslot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return CoachingSlotContainer(data: snapshot.data[index]);
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
