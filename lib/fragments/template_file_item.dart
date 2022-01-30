import 'package:flutter/material.dart';
import 'package:mappy_stars/models/template_file_type.dart';

class TemplateFileItem extends StatelessWidget {
  final TemplateFileType fileType;
  const TemplateFileItem(this.fileType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fileType.title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        )
      ],
    );
  }
}
