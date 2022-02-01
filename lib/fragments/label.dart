import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry? padding;
  const Label(this.label,
      {Key? key, this.padding = const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 4.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
