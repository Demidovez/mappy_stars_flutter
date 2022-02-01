import 'package:flutter/material.dart';
import 'package:mappy_stars/fragments/icon_check_box.dart';

import 'label.dart';

typedef Callback = void Function(bool value);

class LabelCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final Callback onChange;
  const LabelCheckBox(this.label, {Key? key, required this.value, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange(!value),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 0.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Label(
                label,
                padding: EdgeInsets.zero,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconCheckbox(onChange: onChange, isChecked: value),
            )
          ],
        ),
      ),
    );
  }
}
