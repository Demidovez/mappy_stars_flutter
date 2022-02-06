import 'package:flutter/material.dart';

// ignore: todo
// TODO: Некоректное название
class DescPainter extends StatelessWidget {
  const DescPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("День, когда остановились\nвсе звезды",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
        ));
  }
}
