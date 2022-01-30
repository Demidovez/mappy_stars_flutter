import 'package:flutter/material.dart';
import 'package:mappy_stars/models/holst.dart';

import '../holst_item.dart';
import '../label.dart';
import '../list_variants.dart';

class CanvasV1Controller extends StatefulWidget {
  const CanvasV1Controller({Key? key}) : super(key: key);

  @override
  _CanvasV1ControllerState createState() => _CanvasV1ControllerState();
}

class _CanvasV1ControllerState extends State<CanvasV1Controller> {
  final List<Holst> holsts = [];

  @override
  void initState() {
    super.initState();

    holsts.addAll([
      Holst("A4", "210 x 297 мм", 2480.0, 3508.0),
      Holst("A3", "297 x 420 мм", 3508.0, 4961.0),
      Holst("A2", "420 x 594 мм", 4961.0, 7016.0),
      Holst("A1", "594 x 841 мм", 7016.0, 9933.0)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label("Размер холста"),
        ListVariants<Holst>(data: holsts, item: (holst) => HolstItem(holst)),
        const Label("Цвет фона"),
        const Label("Добавить рамку"),
        const Label("Отступ для рамки"),
        const Label("Размер рамки"),
        const Label("Размер рамки"),
        const Label("Размер рамки"),
        const Label("Размер рамки"),
        const Label("Размер рамки"),
        const Label("Цвет рамки")
      ],
    );
  }
}
