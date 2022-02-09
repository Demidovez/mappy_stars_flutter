import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/controllers/canvas/canvas_bloc.dart';

class Holst extends StatelessWidget {
  const Holst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        bool hasHolstBorder = context.select((CanvasBloc bloc) => bloc.state.hasBorderCanvas);
        double indentHolstBorder = context.select((CanvasBloc bloc) => bloc.state.indentBorder);
        double sizeHolstBorder = context.select((CanvasBloc bloc) => bloc.state.sizeBorder);
        Color holstColor = context.select((CanvasBloc bloc) => bloc.state.holstColor);
        Color holstBorderColor = context.select((CanvasBloc bloc) => bloc.state.holstBorderColor);

        print("==== Holst ==========" + DateTime.now().toString());

        return RepaintBoundary(
          child: CustomPaint(
              painter: _HolstPainter(
                  indentHolstBorder: indentHolstBorder,
                  sizeHolstBorder: sizeHolstBorder,
                  holstColor: holstColor,
                  holstBorderColor: holstBorderColor,
                  hasHolstBorder: hasHolstBorder)),
        );
      },
    );
  }
}

class _HolstPainter extends CustomPainter {
  final double indentHolstBorder;
  final double sizeHolstBorder;
  final Color holstColor;
  final Color holstBorderColor;
  final bool hasHolstBorder;

  _HolstPainter(
      {required this.indentHolstBorder,
      required this.sizeHolstBorder,
      required this.holstColor,
      required this.holstBorderColor,
      required this.hasHolstBorder});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = holstColor;
    final borderHolstPaint = Paint()
      ..strokeWidth = sizeHolstBorder
      ..color = holstBorderColor
      ..style = PaintingStyle.stroke;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);
    if (hasHolstBorder) {
      canvas.drawRect(
          Rect.fromLTWH(
              indentHolstBorder + sizeHolstBorder / 2,
              indentHolstBorder + sizeHolstBorder / 2,
              size.width - indentHolstBorder * 2 - sizeHolstBorder,
              size.height - indentHolstBorder * 2 - sizeHolstBorder),
          borderHolstPaint);
    }
  }

  @override
  bool shouldRepaint(_HolstPainter oldDelegate) {
    return indentHolstBorder != oldDelegate.indentHolstBorder ||
        sizeHolstBorder != oldDelegate.sizeHolstBorder ||
        holstColor != oldDelegate.holstColor ||
        holstBorderColor != oldDelegate.holstBorderColor ||
        hasHolstBorder != oldDelegate.hasHolstBorder;
  }
}
