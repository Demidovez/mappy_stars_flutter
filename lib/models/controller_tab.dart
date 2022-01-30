import 'package:flutter/material.dart';

typedef Controller = Widget Function();

class ControllerTab {
  final String title;
  final String iconName;
  final Controller controller;

  ControllerTab(this.title, this.iconName, this.controller);
}
