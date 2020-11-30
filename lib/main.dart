import 'package:disease_detector/theme1/screen/LateBlightDialog.dart';
import 'package:disease_detector/theme1/screen/T1BottomNavigation.dart';
import 'package:disease_detector/theme1/screen/T1Dashboard.dart';
import 'package:disease_detector/theme1/screen/T1Dialog.dart';
import 'package:disease_detector/theme1/screen/T1Profile.dart';
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

          T1Profile.tag: (context) => T1Profile(),
          T1Dashboard.tag: (context) => T1Dashboard(),
          T1Dialog.tag: (context) => T1Dialog(),
          T1WalkThrough.tag: (context) => T1WalkThrough(),
          T1BottomNavigation.tag: (BuildContext context) =>
              T1BottomNavigation(),
          LateDialog.tag: (context) => LateDialog(),
        },
        title: mainAppName,
        home: T1WalkThrough(),
      ),
    );
  }
}
