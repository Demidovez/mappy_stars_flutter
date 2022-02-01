import 'package:flutter/material.dart';
import 'package:mappy_stars/models/holst.dart';

import '../color_item.dart';
import '../holst_item.dart';
import '../label.dart';
import '../label_check_box.dart';
import '../list_variants.dart';
import '../slider_percentage.dart';

class CanvasV1Controller extends StatefulWidget {
  const CanvasV1Controller({Key? key}) : super(key: key);

  @override
  _CanvasV1ControllerState createState() => _CanvasV1ControllerState();
}

class _CanvasV1ControllerState extends State<CanvasV1Controller> {
  final List<Holst> holsts = [];
  final List<Color> colorsHolst = [];
  final List<Color> colorsBorder = [];

  int _activeIndexHolst = 0;
  int _activeIndexColorHolst = 0;
  int _activeIndexColorBorder = 0;
  bool _hasCanvasBorder = true;
  double _indentBorder = 30.0;
  double _sizeBorder = 70.0;

  @override
  void initState() {
    super.initState();

    holsts.addAll([
      Holst("A4", "210 x 297 мм", 2480.0, 3508.0),
      Holst("A3", "297 x 420 мм", 3508.0, 4961.0),
      Holst("A2", "420 x 594 мм", 4961.0, 7016.0),
      Holst("A1", "594 x 841 мм", 7016.0, 9933.0)
    ]);

    colorsHolst.addAll([
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

    colorsBorder.addAll([
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

  void setActiveIndexColorHolst(Color activeColor) {
    setState(() {
      _activeIndexColorHolst = colorsHolst.indexWhere((color) => color == activeColor);
    });
  }

  void setActiveIndexColorBorder(Color activeColor) {
    setState(() {
      _activeIndexColorBorder = colorsBorder.indexWhere((color) => color == activeColor);
    });
  }

  void onHasCanvasBorder(bool has) {
    setState(() {
      _hasCanvasBorder = has;
    });
  }

  void onChangeIndentBorder(double indent) {
    setState(() {
      _indentBorder = indent;
    });
  }

  void onChangeSizeBorder(double size) {
    setState(() {
      _sizeBorder = size;
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
            data: colorsHolst,
            activeIndex: _activeIndexColorHolst,
            item: (color) => ColorItem(color, setActiveIndexColorHolst)),
        LabelCheckBox("Добавить рамку", value: _hasCanvasBorder, onChange: onHasCanvasBorder),
        const Label("Отступ для рамки"),
        SliderPercentage(value: _indentBorder, onChange: onChangeIndentBorder),
        const Label("Размер рамки"),
        SliderPercentage(value: _sizeBorder, onChange: onChangeSizeBorder),
        const Label("Цвет рамки"),
        ListVariants<Color>(
            height: 45,
            shape: EShape.circle,
            data: colorsBorder,
            activeIndex: _activeIndexColorBorder,
            item: (color) => ColorItem(color, setActiveIndexColorBorder))
      ],
    );
  }
}
