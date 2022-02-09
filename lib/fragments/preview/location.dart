import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/controllers/canvas/canvas_bloc.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasBloc, CanvasState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          double sizeHolstBorder = context.select((CanvasBloc bloc) => bloc.state.sizeBorder);
          double indentHolstBorder = context.select((CanvasBloc bloc) => bloc.state.indentBorder);
          // ignore: avoid_print
          print("====  Location  ==========" + DateTime.now().toString());

          return Padding(
            padding: EdgeInsets.only(bottom: indentHolstBorder + sizeHolstBorder + 3),
            child: const _LocationPainter(),
          );
        });
  }
}

class _LocationPainter extends StatelessWidget {
  const _LocationPainter({Key? key}) : super(key: key);

  final TextStyle style = const TextStyle(fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "23 января 2023г, 20:00",
          style: style,
        ),
        Text("Москва, Россия", style: style),
        Text("N 55.45'45'55, E 45.67'76'77", style: style),
      ],
    );
  }
}
