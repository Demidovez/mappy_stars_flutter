import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geojson/geojson.dart';
import 'package:proj4dart/proj4dart.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc()
      : super(MapState(
            sizeMap: 10,
            indentMap: 0,
            color: Colors.black,
            shapeBorderId: 1,
            colorBorder: Colors.red,
            milkywayPaths: [])) {
    on<ShapeBorderIdMapEvent>((event, emit) {
      emit(state.copyWith(shapeBorderId: event.value));
    });
    on<SizeMapEvent>((event, emit) {
      emit(state.copyWith(sizeMap: event.value));
    });
    on<ColorMapEvent>((event, emit) {
      emit(state.copyWith(color: event.value));
    });
    on<IndentMapEvent>((event, emit) {
      emit(state.copyWith(indentMap: event.value));
    });
    on<ColorBorderMapEvent>((event, emit) {
      emit(state.copyWith(colorBorder: event.value));
    });
    on<MilkyWaysMapEvent>((event, emit) async {
      // ignore: todo
      // TODO: Перенести в репозиторий
      final List<Path> milkywayPaths = [];
      final List<GeoJsonPolygon> milkyways = <GeoJsonPolygon>[];

      final geo = GeoJson();
      geo.processedPolygons.listen((GeoJsonPolygon polygon) {
        milkyways.add(polygon);
      });
      geo.endSignal.listen((_) => geo.dispose());

      final data = await rootBundle.loadString('assets/geo/milkyway.json');
      await geo.parse(data, verbose: false);

      double lat = event.lat;
      double lon = event.lon;

      print("$lat $lon");

      var projSrc = Projection.get('EPSG:4326')!;
      var projDst = Projection.parse(
        "+proj=ortho +lat_0=$lat +lon_0=$lon +x_0=0 +y_0=0 +a=190 +b=190 +no_defs",
      );

      for (int i = 0; i < milkyways.length; i++) {
        GeoJsonPolygon milkyway = milkyways[i];

        Path path = Path();
        Point firstPoint = Point(x: 0, y: 0);
        Point currPoint = Point(x: 0, y: 0);

        for (int j = 0; j < milkyway.geoSeries.length; j++) {
          var geoSer = milkyway.geoSeries[j];

          bool isStartedDrawSerie = false;

          for (int k = 0; k < geoSer.geoPoints.length; k++) {
            var point = geoSer.geoPoints[k];

            var pointSrc = Point(x: point.longitude, y: point.latitude);

            try {
              var pointForward = projSrc.transform(projDst, pointSrc);

              if (!isStartedDrawSerie) {
                firstPoint = pointForward;
                path.moveTo(pointForward.x, pointForward.y);
                isStartedDrawSerie = true;
              } else {
                bool isClockWice =
                    (currPoint.x * pointForward.y - pointForward.x * currPoint.y) > 0;

                path.arcToPoint(Offset(pointForward.x, pointForward.y),
                    clockwise: isClockWice, radius: const Radius.circular(190.0));
              }

              currPoint = pointForward;
            } catch (e) {
              if (k == geoSer.geoPoints.length - 1) {
                bool isClockWice = (currPoint.x * firstPoint.y - firstPoint.x * currPoint.y) > 0;

                path.arcToPoint(Offset(firstPoint.x, firstPoint.y),
                    clockwise: isClockWice, radius: const Radius.circular(190.0));
              }
            }
          }
        }

        milkywayPaths.add(path);
      }

      emit(state.copyWith(milkywayPaths: milkywayPaths));
    });
  }
}
