import 'package:flutter/material.dart';

enum EType { full, left, right }

class LabelInput extends StatelessWidget {
  final String label;
  final String value;
  final EType type;
  const LabelInput({Key? key, required this.label, required this.value, this.type = EType.full}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: type == EType.right ? 12.0 : 16.0, right: type == EType.left ? 12.0 : 16.0, top: 16.0, bottom: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xFFEDEEF1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              child: Text(
                value,
                style: const TextStyle(fontSize: 15),
              )),
        ],
      ),
    );
  }
}
