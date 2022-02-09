part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class ShapeBorderIdMapEvent extends MapEvent {
  final int value;

  ShapeBorderIdMapEvent({required this.value});
}

class SizeMapEvent extends MapEvent {
  final double value;

  SizeMapEvent({required this.value});
}

class ColorMapEvent extends MapEvent {
  final Color value;

  ColorMapEvent({required this.value});
}

class IndentMapEvent extends MapEvent {
  final double value;

  IndentMapEvent({required this.value});
}

class ColorBorderMapEvent extends MapEvent {
  final Color value;

  ColorBorderMapEvent({required this.value});
}
