import 'package:flutter/material.dart';
import 'package:mappy_stars/models/template_file_type.dart';

typedef Callback = void Function(int id, BuildContext context);

class TemplateFileItem extends StatelessWidget {
  final TemplateFileType fileType;
  final Callback setActive;
  const TemplateFileItem(this.fileType, this.setActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => setActive(fileType.id, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fileType.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
