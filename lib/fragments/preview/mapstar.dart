import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geojson/geojson.dart';
import 'package:proj4dart/proj4dart.dart';

import '../../bloc/controllers/map/map_bloc.dart';
import '../../bloc/map_layers/map_layers_bloc.dart';

class MapStar extends StatelessWidget {
  const MapStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("====  Map  ==========" + DateTime.now().toString());

    return Column(
      children: [
        BlocSelector<MapBloc, MapState, double>(
          selector: (state) => state.indentMap,
          builder: (context, indentMap) {
            return SizedBox(
              height: indentMap,
            );
          },
        ),
        InkWell(
          onTap: () {
            context.read<MapBloc>().add(MilkyWaysMapEvent(
                lat: -90.0 + Random().nextInt(90 - (-90)) * Random().nextDouble(),
                lon: -180.0 + Random().nextInt(180 - (-180)) * Random().nextDouble()));
          },
          child: SizedBox(
              width: 380,
              height: 380,
              child: RepaintBoundary(
                  child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  BlocBuilder<MapLayersBloc, MapLayersState>(
                    builder: (context, state) {
                      List<Path> milkywayPaths =
                          context.select((MapBloc bloc) => bloc.state.milkywayPaths);

                      // print(" ----------- milkywayPath ");
                      // print(milkywayPath);

                      return CustomPaint(painter: _MilkyWayLayer(milkywayPaths: milkywayPaths));
                    },
                  ),
                  // CustomPaint(painter: _GraticulasLayer()),
                  // CustomPaint(painter: _StarsLayer()),
                  // CustomPaint(painter: _ConstatillationsLayer()),
                  // CustomPaint(painter: _PlanetsLayer()),
                  // CustomPaint(painter: _TitlesLayer()),
                ],
              ))),
        ),
      ],
    );
  }
}

class _MilkyWayLayer extends CustomPainter {
  final List<Path> milkywayPaths;

  _MilkyWayLayer({required this.milkywayPaths});

  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      // ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      ..color = Colors.black;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
    // canvas.drawRect(Rect.fromLTWH(-190, -190, 380, 380), circleRandomPaint);

    for (int i = 0; i < milkywayPaths.length; i++) {
      final Paint _paint = Paint()
        ..color = Colors.white.withOpacity(0.2)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;

      canvas.drawPath(milkywayPaths[i], _paint);
      // if (i < 2) {
      //   final Paint _paint = Paint()
      //     ..color = Colors.black
      //     ..strokeWidth = 1.0
      //     ..style = PaintingStyle.fill
      //     ..strokeCap = StrokeCap.round;

      //   final Paint bg = Paint()..color = Colors.white.withOpacity(0.2);

      //   canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, bg);
      //   canvas.drawPath(milkywayPaths[i], _paint);
      // } else {
      //   final Paint _paint = Paint()
      //     ..color = Colors.white.withOpacity(0.2)
      //     ..strokeWidth = 1.0
      //     ..style = PaintingStyle.fill
      //     ..strokeCap = StrokeCap.round;

      //   canvas.drawPath(milkywayPaths[i], _paint);
      // }
    }
  }

  @override
  bool shouldRepaint(_MilkyWayLayer oldDelegate) {
    return true;
  }
}

class _StarsLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
  }

  @override
  bool shouldRepaint(_StarsLayer oldDelegate) {
    return true;
  }
}

class _ConstatillationsLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
  }

  @override
  bool shouldRepaint(_ConstatillationsLayer oldDelegate) {
    return true;
  }
}

class _PlanetsLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
  }

  @override
  bool shouldRepaint(_PlanetsLayer oldDelegate) {
    return true;
  }
}

class _TitlesLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
  }

  @override
  bool shouldRepaint(_TitlesLayer oldDelegate) {
    return true;
  }
}

class _GraticulasLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
  }

  @override
  bool shouldRepaint(_GraticulasLayer oldDelegate) {
    return true;
  }
}
