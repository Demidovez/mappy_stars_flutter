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
          onLongPress: () {
            context
                .read<MapBloc>()
                .add(MilkyWaysMapEvent(lat: -33.142535425255936, lon: 21.404136340248414));
          },
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
    final _originalMWpaint = Paint()
      // ..color = Colors.white.withOpacity(0.08)
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final _invertedMWpaint = Paint()
      // ..color = Colors.white.withOpacity(0.08)
      ..color = Colors.amber
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final _bgPaint = Paint()..color = Colors.black;
    final _ovalPath = Path()..addOval(Rect.fromCircle(center: Offset.zero, radius: 190));

    // canvas.drawCircle(Offset.zero, 190, _bgPaint);
    canvas.drawRect(Rect.fromLTWH(-190, -190, 380, 380), _bgPaint);
//milkywayPaths.length
    for (int i = 0; i < 1; i++) {
      final _originalPath = milkywayPaths[i];
      final _invertedPath = Path.combine(PathOperation.difference, _ovalPath, _originalPath);

      print("SIZE:");
      print(_originalPath.getBounds().size);
      print(_invertedPath.getBounds().size);

      final _originalMetric = _originalPath
          .computeMetrics(forceClosed: true)
          .toList()
          .map(
            (e) => e.length,
          )
          .reduce((value, element) => value + element);

      final _invertedMetric = _invertedPath
          .computeMetrics(forceClosed: true)
          .toList()
          .map(
            (e) => e.length,
          )
          .reduce((value, element) => value + element);

      print("METRICS:");
      print(_originalMetric);
      print(_invertedMetric);

      if (_originalMetric > _invertedMetric) {
        canvas.drawPath(_originalPath, _originalMWpaint);
      } else {
        canvas.drawPath(_originalPath, _originalMWpaint);
      }

      canvas.drawPath(_invertedPath, _invertedMWpaint);
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
