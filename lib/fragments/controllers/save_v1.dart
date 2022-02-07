import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mappy_stars/models/template_file_type.dart';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';

import '../../bloc/controllers/save/save_bloc.dart';
import '../../bloc/data/data_bloc.dart';
import '../label.dart';
import '../list_variants.dart';
import '../template_file_item.dart';

class SaveV1Controller extends StatelessWidget {
  const SaveV1Controller({Key? key}) : super(key: key);

  void setTemplateFileTypeId(int id, BuildContext context) {
    context.read<SaveBloc>().add(TemplateFileTypeIdSaveEvent(value: id));
  }

  void savePreviewToFile(BuildContext context) async {
    GlobalKey keyPreview = context.read<SaveBloc>().state.globalKeyPreview;

    RenderRepaintBoundary repaintBoundary =
        keyPreview.currentContext?.findRenderObject() as RenderRepaintBoundary;

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
      File("/storage/emulated/0/Download/my_image.png").writeAsBytes(pngBytes!).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(value.path),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label("Формат файла"),
        BlocSelector<SaveBloc, SaveState, int>(
          selector: (state) {
            return state.templateFileTypeId;
          },
          builder: (context, templateFileTypeId) {
            List<TemplateFileType> _templateFileTypes =
                context.select((DataBloc bloc) => bloc.state.templateFileTypes);

            return ListVariants<TemplateFileType>(
                height: 60.0,
                data: _templateFileTypes,
                activeIndex: templateFileTypeId,
                item: (type) => TemplateFileItem(type, setTemplateFileTypeId));
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text('Поделиться',
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
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "или",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text('Сохранить',
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
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {},
              child: const Text('Удалить',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                primary: const Color(0xFFe17055),
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => savePreviewToFile(context),
              child: const Text('Скачать',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                primary: const Color(0xFF5bc3f1),
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
