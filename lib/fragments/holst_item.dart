import 'package:flutter/material.dart';
import 'package:mappy_stars/models/holst.dart';

typedef Callback = void Function(int holstId, BuildContext context);

class HolstItem extends StatelessWidget {
  final Holst holst;
  final Callback setActive;
  const HolstItem(this.holst, this.setActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => setActive(holst.id, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
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
        ),
      ),
    );
  }
}
