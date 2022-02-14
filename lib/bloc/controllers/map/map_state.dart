part of 'map_bloc.dart';

class MapState {
  final double sizeMap;
  final double indentMap;
  final Color color;
  final int shapeBorderId;
  final Color colorBorder;
  final List<Path> milkywayPaths;

  MapState(
      {required this.sizeMap,
      required this.indentMap,
      required this.color,
      required this.shapeBorderId,
      required this.colorBorder,
      required this.milkywayPaths});

  MapState copyWith(
      {double? sizeMap,
      double? indentMap,
      Color? color,
      int? shapeBorderId,
      Color? colorBorder,
      List<Path>? milkywayPaths}) {
    return MapState(
        sizeMap: sizeMap ?? this.sizeMap,
        indentMap: indentMap ?? this.indentMap,
        color: color ?? this.color,
        shapeBorderId: shapeBorderId ?? this.shapeBorderId,
        colorBorder: colorBorder ?? this.colorBorder,
        milkywayPaths: milkywayPaths ?? this.milkywayPaths);
  }
}
