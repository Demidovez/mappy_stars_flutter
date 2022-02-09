import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/controllers/canvas/canvas_bloc.dart';

class Desc extends StatelessWidget {
  const Desc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasBloc, CanvasState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          // ignore: avoid_print
          print("====  Desc  ==========" + DateTime.now().toString());

          return const _DescPainter();
        });
  }
}

class _DescPainter extends StatelessWidget {
  const _DescPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("День, когда остановились\nвсе звезды",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
        ));
  }
}
