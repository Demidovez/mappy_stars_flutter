import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) async {
    final recorder = ui.PictureRecorder();
    final canvas =
        Canvas(recorder, Rect.fromPoints(const Offset(0.0, 0.0), const Offset(2000.0, 2000.0)));

    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, circleRandomPaint);

    final picture = recorder.endRecording();
    final ui.Image img = await picture.toImage(2000, 2000);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List();

    PermissionStatus status = await Permission.storage.status;

    if (!status.isGranted) {
      await [
        Permission.storage,
      ].request();
    }

    if (status.isGranted) {
      File("/storage/emulated/0/Download/my_image_.png").writeAsBytes(pngBytes!);
    }
  }

  @override
  bool shouldRepaint(MapPainter oldDelegate) {
    return true;
  }
}
