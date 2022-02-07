part of 'canvas_bloc.dart';

class CanvasState {
  final int holstId;
  final Color holstColor;
  final bool hasBorderCanvas;
  final double indentBorder;
  final double sizeBorder;
  final Color holstBorderColor;

  CanvasState(
      {required this.holstId,
      required this.holstColor,
      required this.hasBorderCanvas,
      required this.indentBorder,
      required this.sizeBorder,
      required this.holstBorderColor});

  CanvasState copyWith(
      {int? holstId,
      Color? holstColor,
      bool? hasBorderCanvas,
      double? indentBorder,
      double? sizeBorder,
      Color? holstBorderColor}) {
    return CanvasState(
        holstId: holstId ?? this.holstId,
        holstColor: holstColor ?? this.holstColor,
        hasBorderCanvas: hasBorderCanvas ?? this.hasBorderCanvas,
        indentBorder: indentBorder ?? this.indentBorder,
        sizeBorder: sizeBorder ?? this.sizeBorder,
        holstBorderColor: holstBorderColor ?? this.holstBorderColor);
  }
}
