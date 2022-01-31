import 'package:flutter/material.dart';
import 'package:mappy_stars/models/holst.dart';

import '../color_item.dart';
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
  final List<Color> colors = [];

  int _activeIndexHolst = 0;
  int _activeIndexColor = 0;

  @override
  void initState() {
    super.initState();

    holsts.addAll([
      Holst("A4", "210 x 297 мм", 2480.0, 3508.0),
      Holst("A3", "297 x 420 мм", 3508.0, 4961.0),
      Holst("A2", "420 x 594 мм", 4961.0, 7016.0),
      Holst("A1", "594 x 841 мм", 7016.0, 9933.0)
    ]);

    colors.addAll([
      Colors.transparent,
      const Color(0xFF000000),
      const Color(0xFFFFFFFF),
      const Color(0xFF1ABC9C),
      const Color(0xFF16A085),
      const Color(0xFF2ECC71),
      const Color(0xFF27AE60),
      const Color(0xFF3498DB),
      const Color(0xFF2980B9),
      const Color(0xFF9B59B6),
      const Color(0xFF8E44AD),
      const Color(0xFF34495E),
      const Color(0xFF2C3E50),
      const Color(0xFFF1C40F),
      const Color(0xFFF39C12),
      const Color(0xFFE67E22),
      const Color(0xFFD35400),
      const Color(0xFFE74C3C),
      const Color(0xFFC0392B),
      const Color(0xFFBDC3C7),
      const Color(0xFF95A5A6),
      const Color(0xFF7F8C8D)
    ]);
  }

  void setActiveIndexHolst(Holst activeHolst) {
    setState(() {
      _activeIndexHolst = holsts.indexWhere((holst) => holst.title == activeHolst.title);
    });
  }

  void setActiveIndexColor(Color activeColor) {
    setState(() {
      _activeIndexColor = colors.indexWhere((color) => color == activeColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label("Размер холста"),
        ListVariants<Holst>(
            data: holsts, activeIndex: _activeIndexHolst, item: (holst) => HolstItem(holst, setActiveIndexHolst)),
        const Label("Цвет фона"),
        ListVariants<Color>(
            height: 45,
            shape: EShape.circle,
            data: colors,
            activeIndex: _activeIndexColor,
            item: (color) => ColorItem(color, setActiveIndexColor)),
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
