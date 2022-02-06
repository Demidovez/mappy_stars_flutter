import 'package:flutter/material.dart';

// ignore: todo
// TODO: Некоректное название
class LocationPainter extends StatelessWidget {
  LocationPainter({Key? key}) : super(key: key);

  TextStyle style = const TextStyle(fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "23 января 2023г, 20:00",
          style: style,
        ),
        Text("Москва, Россия", style: style),
        Text("N 55.45'45'55, E 45.67'76'77", style: style),
      ],
    );
  }
}
