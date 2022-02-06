import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:io';

class SaveToFile extends StatefulWidget {
  final Widget child;
  const SaveToFile({Key? key, required this.child}) : super(key: key);

  @override
  State<SaveToFile> createState() => _SaveToFileState();
}

class _SaveToFileState extends State<SaveToFile> {
  final GlobalKey _globalKey = GlobalKey();

  void capture() async {
    RenderRepaintBoundary repaintBoundary =
        _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    final ui.Image image = await repaintBoundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final pngBytes = byteData?.buffer.asUint8List();

    PermissionStatus status = await Permission.storage.status;

    if (!status.isGranted) {
      await [
        Permission.storage,
      ].request();
    }

    if (status.isGranted) {
      File("/storage/emulated/0/Download/my_image.png").writeAsBytes(pngBytes!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => capture(),
      child: RepaintBoundary(
        key: _globalKey,
        child: widget.child,
      ),
    );
  }
}
