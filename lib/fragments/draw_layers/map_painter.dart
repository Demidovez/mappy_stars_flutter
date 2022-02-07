import 'package:flutter/material.dart';
import 'dart:math' as math;

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, circleRandomPaint);
  }

  @override
  bool shouldRepaint(MapPainter oldDelegate) {
    return true;
  }
}
