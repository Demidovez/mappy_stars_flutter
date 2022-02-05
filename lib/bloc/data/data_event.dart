part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class HolstsDataEvent extends DataEvent {
  final List<Holst> value;

  HolstsDataEvent({required this.value});
}

class HolstColorsDataEvent extends DataEvent {
  final List<Color> value;

  HolstColorsDataEvent({required this.value});
}

class HolstBorderColorsDataEvent extends DataEvent {
  final List<Color> value;

  HolstBorderColorsDataEvent({required this.value});
}
