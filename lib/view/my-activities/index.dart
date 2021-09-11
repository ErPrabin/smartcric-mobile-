
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcric/controller/myactivitiescontroller.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/model/myactivity.dart';
import 'package:smartcric/view/my-activities/myactivitydetail.dart';

class MyActivities extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  Future<List<MyActivity>> myactivities;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myactivities = MyActivityController.fetchMyActivity();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        centerTitle: true,
        elevation: 0,
        title: Text('My Activities',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 24, color: kwhitetext)),
        leading: IconButton(
          iconSize: 24,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: kprimarycolor,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: myactivities,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // controller: controller,
                        childAspectRatio: (itemWidth / (itemHeight * 0.15)),
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(snapshot.data.length, (index) {
                          var data = snapshot.data[index];
                          return InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Expanded(
                                    child: Text(
                                  data.name,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.blue, letterSpacing: .5),
                                  ),
                                )),
                              ),
                            ),
                            onTap: () {
                              print('clicked');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyActivityDetail(data: data)));
                            },
                          );
                        }));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                })),
      ),
    );
  }
}
