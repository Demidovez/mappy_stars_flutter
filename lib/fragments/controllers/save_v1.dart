import 'package:flutter/material.dart';
import 'package:mappy_stars/models/template_file_type.dart';

import '../label.dart';

class SaveV1Controller extends StatefulWidget {
  const SaveV1Controller({Key? key}) : super(key: key);

  @override
  _SaveV1ControllerState createState() => _SaveV1ControllerState();
}

class _SaveV1ControllerState extends State<SaveV1Controller> {
  final List<TemplateFileType> fileTypes = [];

  @override
  void initState() {
    super.initState();

    fileTypes.addAll([TemplateFileType("JPG"), TemplateFileType("PDF")]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Label("Формат файла"),
        //   ListVariants<TemplateFileType>(
        //       height: 60.0, data: fileTypes, item: (TemplateFileType type) => TemplateFileItem(type))
        //
      ],
    );
  }
}
