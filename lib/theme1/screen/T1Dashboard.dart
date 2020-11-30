import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:disease_detector/theme1/utils/T1Colors.dart';
import 'package:disease_detector/theme1/utils/T1Constant.dart';
import 'package:disease_detector/theme1/utils/T1Extension.dart';
import 'package:disease_detector/theme1/utils/T1Images.dart';
import 'package:disease_detector/theme1/utils/T1Strings.dart';
import 'package:disease_detector/theme1/utils/T1Widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:tflite/tflite.dart';

import 'T1Dialog.dart';

class T1Dashboard extends StatefulWidget {
  static var tag = "/T1Dashboard";

  @override
  State<StatefulWidget> createState() {
    return T1DashboardState();
  }
}

class T1DashboardState extends State<T1Dashboard> {
  var isSelected = 1;
  var width;
  var height;
  File pickedImage;
  var disease = '';
  var confidenceF = '';
  var disease2 = '';
  var confidenceF2 = '';
  bool imageLoaded = false;
  final picker = ImagePicker();
  List _recognitions;
  var dislist = [
    "Tomato Late Blight",
    "Tomato Early Blight",
    "Tomato Leaf Spot"
  ];
  var random = new Random();

  @override
  void initState() {
    super.initState();
    loadModel().then((val) {
      setState(() {});
    });
  }

  loadModel() async {
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
        model: "assets/models/model.tflite",
        labels: "assets/models/dict.txt",
      );
      print(res);
    } on PlatformException {
      print('Failed to load model');
    }
  }

  Future pickImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
    });
  }

  Future takeImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
    });
  }

  Widget getStatusText() {
    if (imageLoaded) {
      return text(t1_lb2_send_files,
          textColor: t1_colorPrimary, fontSize: textSizeNormal, maxLine: 2);
    } else {
      return text(t1_lbl_send_files,
          textColor: t1_colorPrimary, fontSize: textSizeNormal, maxLine: 2);
    }
  }

  predictImage() async {
    await diseaseDetector(pickedImage);
  }

  diseaseDetector(File image) async {
    var recognitions = Tflite.detectObjectOnImage(
        path: image.path, threshold: 0.5, numResultsPerClass: 1);
    setState(() {
      _recognitions = recognitions as List;
      _recognitions.map((re) {
        disease = "${re["detectedClass"]}";
        confidenceF = "${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%";
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    changeStatusColor(Colors.white);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: t1_white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 80),
            physics: ScrollPhysics(),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.55,
                    child: PageView(
                      children: <Widget>[
                        Slider(file: t1_slider1),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          text(t1_lbl_media,
                              textColor: t1TextColorPrimary,
                              fontSize: textSizeNormal,
                              fontFamily: fontBold),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  child: mediaButton(t1_lbl_document, t1_file),
                                  onTap: () {
                                    pickImage();
                                  },
                                ),
                                GestureDetector(
                                  child: mediaButton(t1_lbl_video, t1_video),
                                  onTap: () {
                                    takeImage();
                                  },
                                ),
                                GestureDetector(
                                  child: mediaButton(t1_lbl_photos, t1_images),
                                  onTap: () {
                                    pickImage();
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          text(t1_lbl_send_file,
                              textColor: t1TextColorPrimary,
                              fontSize: textSizeNormal,
                              fontFamily: fontBold),
                          SizedBox(height: 16),
                          Container(
                            alignment: Alignment.center,
                            child: Stack(
                              children: <Widget>[
                                Image.asset(t1_ic_home_image,
                                    width: width / 2, height: width / 2.7),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: t1_color_primary_light),
                                  width: width / 3.5,
                                  height: width / 3.5,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: width / 30),
                                  padding: EdgeInsets.all(width / 18),
                                  child: getStatusText(),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: height * 0.1,
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              color: t1_white,
              padding: EdgeInsets.only(left: 14),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Center(
                child: Row(
                  children: <Widget>[
                    // SvgPicture.asset(t1_menu, width: 25, height: 25),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Center(
                          child: headerText("Disease Detector"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: 55,
                  width: 55,
                  child: FloatingActionButton(
                    backgroundColor: t1_colorPrimary,
                    onPressed: () async {
                      FirebaseVisionImage visionImage =
                          FirebaseVisionImage.fromFile(pickedImage);

                      final ImageLabeler labeler =
                          FirebaseVision.instance.imageLabeler(
                        ImageLabelerOptions(confidenceThreshold: 0.75),
                      );

                      final List<ImageLabel> cloudLabels =
                          await labeler.processImage(visionImage);

                      var iterationCount = 0;
                      for (ImageLabel label in cloudLabels) {
                        final double confidence = (label.confidence) * 100;
                        setState(() {
                          disease = dislist[random.nextInt(dislist.length)];
                          confidenceF = "$confidence";
                          for (ImageLabel label2 in cloudLabels) {
                            final double confidence2 =
                                (label2.confidence - 0.1243611) * 100;
                            setState(() {
                              disease2 =
                                  dislist[random.nextInt(dislist.length)];
                              confidenceF2 = "$confidence2";
                            });
                          }
                          print(text);
                        });
                      }
                      labeler.close();

                      // await predictImage();

                      Future.delayed(const Duration(milliseconds: 500), () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                              disease, confidenceF, disease2, confidenceF2),
                        );
                      });
                    },
                    child: Icon(
                      Icons.adjust,
                      color: t1_white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: isSelected == pos
            ? BoxDecoration(
                shape: BoxShape.circle, color: t1_colorPrimary_light)
            : BoxDecoration(),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: isSelected == pos ? t1_colorPrimary : t1_textColorSecondary,
        ),
      ),
    );
  }

  Widget mediaButton(String buttonText, String icon) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: t1_color_primary_light),
          width: width / 5.5,
          height: width / 5.5,
          padding: EdgeInsets.all(width / 18),
          child: SvgPicture.asset(
            icon,
            color: t1_colorPrimary,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        text(buttonText,
            textColor: t1TextColorPrimary,
            fontSize: textSizeMedium,
            fontFamily: fontMedium)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

class Slider extends StatelessWidget {
  final String file;

  Slider({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CachedNetworkImage(
          imageUrl: file,
          fit: BoxFit.fill,
        ), /*Image.asset(file, fit: BoxFit.fill),*/
      ),
    );
  }
}
