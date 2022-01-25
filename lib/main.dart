import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappy_stars/pages/projects.dart';
import 'package:mappy_stars/pages/settings.dart';
import 'package:mappy_stars/pages/template.dart';
import 'package:mappy_stars/pages/templates.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: const Color(0xFF4a5660)),
    initialRoute: '/templates',
    routes: {
      '/templates': (context) => const Templates(),
      '/template': (context) => const Template(),
      '/projects': (context) => const Projects(),
      '/settings': (context) => const Settings(),
    },
  ));
}
