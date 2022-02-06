import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: todo
// TODO: Некоректное название
class SeparatorPainter extends StatelessWidget {
  const SeparatorPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SvgPicture.asset(
        'assets/icons/maskarad_shape.svg',
        color: Colors.black,
        width: 100,
      ),
    );
  }
}
