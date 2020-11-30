import 'package:disease_detector/theme1/screen/T1Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_detector/theme1/screen/t1_walk/IntroScreen.dart';
import 'package:disease_detector/theme1/screen/t1_walk/Walkthrough.dart';
import 'package:disease_detector/theme1/utils/T1Images.dart';

class T1WalkThrough extends StatelessWidget {
  static var tag = "/T1WalkThrough";

  final List<Walkthrough> list = [
    Walkthrough(
        title: "Camera",
        content: "Add Images to be detected through your camera.",
        imageIcon: t1_walk1),
    Walkthrough(
        title: "Gallery",
        content: "Select Images from your gallery.",
        imageIcon: t1_walk2),
    Walkthrough(
        title: "Scan Images",
        content:
            "Let the app do the scanning and get quick and accurate results.",
        imageIcon: t1_walk3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IntroScreen(
          list,
          MaterialPageRoute(builder: (context) => T1Dashboard()),
        ),
      ),
    );
  }
}
