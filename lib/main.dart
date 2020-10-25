import 'package:disease_detector/theme1/screen/T1BottomNavigation.dart';
import 'package:disease_detector/theme1/screen/T1BottomSheet.dart';
import 'package:disease_detector/theme1/screen/T1Card.dart';
import 'package:disease_detector/theme1/screen/T1Dashboard.dart';
import 'package:disease_detector/theme1/screen/T1Dialog.dart';
import 'package:disease_detector/theme1/screen/T1ImageSlider.dart';
import 'package:disease_detector/theme1/screen/T1Listing.dart';
import 'package:disease_detector/theme1/screen/T1Login.dart';
import 'package:disease_detector/theme1/screen/T1Profile.dart';
import 'package:disease_detector/theme1/screen/T1Search.dart';
import 'package:disease_detector/theme1/screen/T1Sidemenu.dart';
import 'package:disease_detector/theme1/screen/T1Signup.dart';
import 'package:disease_detector/theme1/screen/T1WalkThrough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'dashboard/screen/Dashboard1.dart';
import 'main/screens/ProkitScreenListing.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppConstant.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(appStore.selectedLanguage),
        supportedLocales: [Locale('en', '')],
        routes: <String, WidgetBuilder>{
          /**launcher screen routes*/
          ProkitScreenListing.tag: (context) => ProkitScreenListing(),

          /**Dashboard screens routes*/
          Dashboard1.tag: (context) => Dashboard1(),

          /**Theme 1 screens routes*/
          T1Login.tag: (context) => T1Login(),
          T1Signup.tag: (context) => T1Signup(),
          T1Profile.tag: (context) => T1Profile(),
          T1Dashboard.tag: (context) => T1Dashboard(),
          T1Listing.tag: (context) => T1Listing(),
          T1Dialog.tag: (context) => T1Dialog(),
          T1Card.tag: (context) => T1Card(),
          T1WalkThrough.tag: (context) => T1WalkThrough(),
          T1SideMenu.tag: (BuildContext context) => T1SideMenu(),
          T1BottomNavigation.tag: (BuildContext context) => T1BottomNavigation(),
          T1BottomSheet.tag: (BuildContext context) => T1BottomSheet(),
          T1Search.tag: (BuildContext context) => T1Search(),
          T1ImageSlider.tag: (BuildContext context) => T1ImageSlider(),

        },
        title: mainAppName,
        home:T1WalkThrough(),
      ),
    );
  }
}
