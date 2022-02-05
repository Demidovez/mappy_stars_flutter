import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef Callback = void Function(bool value);

class IconCheckbox extends StatelessWidget {
  final Callback onChange;
  final bool isChecked;
  final double size;
  final double? iconSize;
  final Color selectedColor;
  final Color selectedIconColor;
  final Color borderColor;
  final Icon? checkIcon;

  const IconCheckbox(
      {Key? key,
      required this.isChecked,
      required this.onChange,
      this.size = 35.0,
      this.iconSize,
      this.selectedColor = const Color(0xFF4a5660),
      this.selectedIconColor = Colors.white,
      this.borderColor = const Color(0x994a5660),
      this.checkIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () => onChange(!isChecked),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
                color: isChecked ? selectedColor : Colors.transparent,
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(
                  color: borderColor,
                  width: 2,
                )),
            width: size,
            height: size,
            child: Container(
              padding: EdgeInsets.all(size / 5),
              child: isChecked
                  ? SvgPicture.asset(
                      'assets/icons/check.svg',
                      color: selectedIconColor,
                    )
                  : null,
            ),
          ),
        ));
  }
}
