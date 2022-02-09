import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/controllers/canvas/canvas_bloc.dart';

// ignore: todo
// TODO: Некоректное название
class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasBloc, CanvasState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          // ignore: avoid_print
          print("====  Separator  ==========" + DateTime.now().toString());

          return const _SeparatorPainter();
        });
  }
}

class _SeparatorPainter extends StatelessWidget {
  const _SeparatorPainter({Key? key}) : super(key: key);

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
