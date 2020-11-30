import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_detector/theme1/screen/T1Profile.dart';
import 'package:disease_detector/theme1/utils/T1Colors.dart';
import 'package:disease_detector/theme1/utils/T1Constant.dart';
import 'package:disease_detector/theme1/utils/T1Images.dart';
import 'package:disease_detector/theme1/utils/T1Strings.dart';
import 'package:disease_detector/theme1/utils/T1Widget.dart';

import 'T1Dashboard.dart';

class T1Dialog extends StatelessWidget {
  static var tag = "/T1Dialog";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog3("", "", "", ""),
      );
    });
    return T1Profile();
  }
}

class CustomDialog3 extends StatelessWidget {
  var diseaseF;
  var confidenceF;
  var diseaseF2;
  var confidenceF2;
  CustomDialog3(var disease, var confidence, var disease2, var confidence2) {
    this.diseaseF = disease;
    this.confidenceF = confidence;
    this.diseaseF2 = disease2;
    this.confidenceF2 = confidence2;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(
          context, diseaseF, confidenceF, diseaseF2, confidenceF2),
    );
  }
}

dialogContent(BuildContext context, var disease, var confidence, var disease2,
    var confidence2) {
  var diseaseF = disease;
  var confidenceF = confidence;
  var diseaseF2 = disease2;
  var confidenceF2 = confidence2;
  return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                child: Icon(Icons.close, color: t1TextColorPrimary)),
          ),
          text("Tomato Early Blight",
              textColor: Colors.green,
              fontFamily: fontBold,
              fontSize: textSizeLarge),
          SizedBox(height: 24),
          /*Image.asset(
            t1_ic_dialog,
            color: Colors.green,
            width: 95,
            height: 95,
          ),*/
          SizedBox(height: 24),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  text(
                      "Early blight is a common tomato disease caused by the fungus Alternaria solani. It can affect almost all parts of the tomato plants, including the leaves, stems, and fruits. The plants may not die, but they will be weakened and will set fewer tomatoes than normal. Early blight generally attacks older plants, but it can also occur on seedlings.",
                      fontSize: textSizeMedium,
                      maxLine: 20,
                      isCentered: false),
                ],
              )),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: new BoxDecoration(
              color: t1_colorPrimary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              child: text("Close",
                  textColor: t1_white,
                  fontFamily: fontMedium,
                  fontSize: textSizeNormal),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => T1Dashboard()));
              },
            ),
          )
        ],
      ));
}
