import 'package:flutter/material.dart';
import 'package:mappy_stars/models/holst.dart';

class HolstItem extends StatelessWidget {
  final Holst holst;
  const HolstItem(this.holst, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          holst.title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        Text(
          holst.subtitle,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
