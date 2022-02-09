import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

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
        SizedBox(
            width: 380,
            height: 380,
            child: RepaintBoundary(
                child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                BlocBuilder<MapLayersBloc, MapLayersState>(
                  builder: (context, state) {
                    return CustomPaint(painter: _MilkyWayLayer());
                  },
                ),
                // CustomPaint(painter: _GraticulasLayer()),
                // CustomPaint(painter: _StarsLayer()),
                // CustomPaint(painter: _ConstatillationsLayer()),
                // CustomPaint(painter: _PlanetsLayer()),
                // CustomPaint(painter: _TitlesLayer()),
              ],
            ))),
      ],
    );
  }
}

class _MilkyWayLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circleRandomPaint = Paint()
      ..color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 190, circleRandomPaint);
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
