import 'package:flutter/material.dart';
import 'package:smartcric/controller/homeworkcontroller.dart';
import 'package:smartcric/helper/constants.dart';

class HomeWorkContainer extends StatelessWidget {
  // const HomeWorkContainer({ Key? key }) : super(key: key);
  var data;
  HomeWorkContainer({this.data});

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
                  data.name,
                  style: ktextstyle,
                ),
                InkWell(
                  child: Icon(Icons.download),
                  onTap: () {
                    print('download');
                    HomeworkController().downloadHomework(data.id,data.name);
                  },
                ),
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
