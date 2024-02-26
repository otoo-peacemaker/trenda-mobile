import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trenda/app.dart';

import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(const TrendaApp());
    CustomEasyLoading.configure();
  });
}
