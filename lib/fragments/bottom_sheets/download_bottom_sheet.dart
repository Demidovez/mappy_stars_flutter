import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

import '../show_up.dart';

enum EStatus { idle, loading, done }

class DownloadBottomSheet extends StatefulWidget {
  final GlobalKey keyPreview;
  const DownloadBottomSheet({Key? key, required this.keyPreview}) : super(key: key);

  @override
  State<DownloadBottomSheet> createState() => _DownloadBottomSheetState();
}

class _DownloadBottomSheetState extends State<DownloadBottomSheet> {
  EStatus _status = EStatus.loading;

  @override
  void initState() {
    super.initState();

    if (_status == EStatus.loading) {
      download();
    }
  }

  void download() async {
    print("======= download");

    RenderRepaintBoundary repaintBoundary =
        widget.keyPreview.currentContext?.findRenderObject() as RenderRepaintBoundary;

    // ignore: todo
    // TODO: Запихнуть в изолят
    await Future.delayed(Duration.zero, () => {});
    final ui.Image image = await repaintBoundary.toImage(pixelRatio: 2.75 * 10);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final pngBytes = byteData?.buffer.asUint8List();

    File("/storage/emulated/0/Download/my_image.png").writeAsBytes(pngBytes!).then((_) {
      setState(() {
        _status = EStatus.done;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("======= build");
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFe1e1e8), borderRadius: BorderRadius.all(Radius.circular(35))),
              width: 60,
              height: 5,
            ),
            SizedBox(
                height: 150,
                child: _status == EStatus.loading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                              height: 70.0,
                              width: 70.0,
                              child: CircularProgressIndicator(
                                color: const Color(0xFF4a5660).withOpacity(0.8),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Загрузка...", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Transform.scale(
                            scale: 1.8,
                            child: Lottie.asset(
                              'assets/lottie/done_downloading.json',
                              repeat: false,
                              height: 70.0,
                              width: 70.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const ShowUp(
                              delay: 300,
                              child: Text("Загружено!",
                                  style: TextStyle(fontWeight: FontWeight.w600))),
                        ],
                      )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: _status == EStatus.loading ? null : () => {},
                  child: const Text('Продолжить',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xFF4a5660),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(
                      width: 2.0,
                      color: _status == EStatus.loading ? Colors.grey : const Color(0xFF4a5660),
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  // onPressed: () => Navigator.pop(context),
                  onPressed: _status == EStatus.loading ? null : () => Navigator.pop(context),
                  child: const Text('Открыть',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    primary: const Color(0xFF4a5660),
                    elevation: 0,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
