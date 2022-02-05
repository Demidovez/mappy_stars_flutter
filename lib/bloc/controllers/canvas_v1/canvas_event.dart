part of 'canvas_bloc.dart';

@immutable
abstract class CanvasEvent {}

class HolstIdCanvasEvent extends CanvasEvent {
  final int value;

  HolstIdCanvasEvent({required this.value});
}

class HolstColorCanvasEvent extends CanvasEvent {
  final Color value;

  HolstColorCanvasEvent({required this.value});
}

class HasBorderCanvasEvent extends CanvasEvent {
  final bool value;

  HasBorderCanvasEvent({required this.value});
}

class IndentBorderCanvasEvent extends CanvasEvent {
  final double value;

  IndentBorderCanvasEvent({required this.value});
}

class SizeBorderCanvasEvent extends CanvasEvent {
  final double value;

  SizeBorderCanvasEvent({required this.value});
}

class ColorBorderCanvasEvent extends CanvasEvent {
  final Color value;

  ColorBorderCanvasEvent({required this.value});
}
