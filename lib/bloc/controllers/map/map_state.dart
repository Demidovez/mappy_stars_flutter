part of 'map_bloc.dart';

class MapState {
  final double sizeMap;
  final double indentMap;
  final Color color;
  final int shapeBorderId;
  final Color colorBorder;

  MapState(
      {required this.sizeMap,
      required this.indentMap,
      required this.color,
      required this.shapeBorderId,
      required this.colorBorder});

  MapState copyWith(
      {double? sizeMap, double? indentMap, Color? color, int? shapeBorderId, Color? colorBorder}) {
    return MapState(
        sizeMap: sizeMap ?? this.sizeMap,
        indentMap: indentMap ?? this.indentMap,
        color: color ?? this.color,
        shapeBorderId: shapeBorderId ?? this.shapeBorderId,
        colorBorder: colorBorder ?? this.colorBorder);
  }
}
