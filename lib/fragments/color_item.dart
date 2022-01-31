import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef Callback = void Function(Color color);

class ColorItem extends StatelessWidget {
  final Color color;
  final Callback setActive;
  const ColorItem(this.color, this.setActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setActive(color),
      child: color == Colors.transparent
          ? SvgPicture.asset(
              'assets/icons/colors.svg',
              width: 1,
            )
          : Container(color: color),
    );
  }
}
