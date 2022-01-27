import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappy_stars/pages/tabs.dart';
import 'package:mappy_stars/pages/template.dart';
import 'constants/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEDEEF1),
        primaryColor: const Color(0xFF4a5660),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color(0xFF4a5660)),
        )),
    initialRoute: Routes.Tabs,
    routes: {
      Routes.Tabs: (context) => const Tabs(),
      Routes.Template: (context) => const Template(),
    },
  ));
}
