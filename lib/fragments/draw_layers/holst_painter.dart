import 'package:flutter/material.dart';

class HolstPainter extends CustomPainter {
  final double indentHolstBorder;
  final double sizeHolstBorder;
  final Color holstColor;
  final Color holstBorderColor;
  final bool hasHolstBorder;

  HolstPainter(
      {required this.indentHolstBorder,
      required this.sizeHolstBorder,
      required this.holstColor,
      required this.holstBorderColor,
      required this.hasHolstBorder});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = holstColor;
    final borderHolstPaint = Paint()
      ..strokeWidth = sizeHolstBorder
      ..color = holstBorderColor
      ..style = PaintingStyle.stroke;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);
    if (hasHolstBorder) {
      canvas.drawRect(
          Rect.fromLTWH(
              indentHolstBorder + sizeHolstBorder / 2,
              indentHolstBorder + sizeHolstBorder / 2,
              size.width - indentHolstBorder * 2 - sizeHolstBorder,
              size.height - indentHolstBorder * 2 - sizeHolstBorder),
          borderHolstPaint);
    }
  }

  @override
  bool shouldRepaint(HolstPainter oldDelegate) {
    return indentHolstBorder != oldDelegate.indentHolstBorder ||
        sizeHolstBorder != oldDelegate.sizeHolstBorder ||
        holstColor != oldDelegate.holstColor ||
        holstBorderColor != oldDelegate.holstBorderColor ||
        hasHolstBorder != oldDelegate.hasHolstBorder;
  }
}
