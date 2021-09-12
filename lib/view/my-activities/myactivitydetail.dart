import 'package:flutter/material.dart';
import 'package:smartcric/helper/constants.dart';
import 'package:smartcric/util.dart';
import 'package:video_player/video_player.dart';

class MyActivityDetail extends StatefulWidget {
  // const MyActivityDetail({ Key? key }) : super(key: key);
  var data;
  MyActivityDetail({this.data});

  @override
  _MyActivityDetailState createState() => _MyActivityDetailState();
}

class _MyActivityDetailState extends State<MyActivityDetail> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://192.168.100.146:8080/images/upload-file/20210911134439929092.mp4' );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    widget.data.name,
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
                    striptags(widget.data.description),
                    style: kdescriptionystyle,
                  )),
                ],
              ),
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
