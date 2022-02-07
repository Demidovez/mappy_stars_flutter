import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mappy_stars/bloc/controllers/canvas/canvas_bloc.dart';
import 'package:mappy_stars/bloc/controllers/save/save_bloc.dart';
import 'package:mappy_stars/fragments/draw_layers/holst_painter.dart';
import 'package:mappy_stars/fragments/draw_layers/location_painter.dart';
import 'draw_layers/desc_painter.dart';
import 'draw_layers/map_painter.dart';
import 'draw_layers/separator_painter.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    context.read<SaveBloc>().add(GlobalKeyPreviewSaveEvent(value: _globalKey));
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Builder(
                builder: (BuildContext context) {
                  bool hasHolstBorder =
                      context.select((CanvasBloc bloc) => bloc.state.hasBorderCanvas);
                  double indentHolstBorder =
                      context.select((CanvasBloc bloc) => bloc.state.indentBorder);
                  double sizeHolstBorder =
                      context.select((CanvasBloc bloc) => bloc.state.sizeBorder);
                  Color holstColor = context.select((CanvasBloc bloc) => bloc.state.holstColor);
                  Color holstBorderColor =
                      context.select((CanvasBloc bloc) => bloc.state.holstBorderColor);

                  print("==== Holst ==========" + DateTime.now().toString());

                  return RepaintBoundary(
                    child: CustomPaint(
                        painter: HolstPainter(
                            indentHolstBorder: indentHolstBorder,
                            sizeHolstBorder: sizeHolstBorder,
                            holstColor: holstColor,
                            holstBorderColor: holstBorderColor,
                            hasHolstBorder: hasHolstBorder)),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<CanvasBloc, CanvasState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      double indent = 20.0;

                      return Padding(
                        padding: EdgeInsets.only(top: indent),
                        child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.green.withOpacity(0.5),
                            child: RepaintBoundary(child: CustomPaint(painter: MapPainter()))),
                      );
                    },
                  ),
                  BlocBuilder<CanvasBloc, CanvasState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) {
                        // ignore: avoid_print
                        print("====  Desc  ==========" + DateTime.now().toString());

                        return const DescPainter();
                      }),
                  BlocBuilder<CanvasBloc, CanvasState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) {
                        // ignore: avoid_print
                        print("====  Separator  ==========" + DateTime.now().toString());

                        return const SeparatorPainter();
                      }),
                  BlocBuilder<CanvasBloc, CanvasState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) {
                        double sizeHolstBorder =
                            context.select((CanvasBloc bloc) => bloc.state.sizeBorder);
                        double indentHolstBorder =
                            context.select((CanvasBloc bloc) => bloc.state.indentBorder);
                        // ignore: avoid_print
                        print("====  Location  ==========" + DateTime.now().toString());

                        return Padding(
                          padding: EdgeInsets.only(bottom: indentHolstBorder + sizeHolstBorder + 3),
                          child: LocationPainter(),
                        );
                      }),
                ],
              )
            ],
          )),
    );
  }
}
