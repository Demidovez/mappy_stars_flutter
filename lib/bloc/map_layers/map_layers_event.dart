part of 'map_layers_bloc.dart';

@immutable
abstract class MapLayersEvent {}

class GeoMapPathMapLayersEvent extends MapLayersEvent {
  final Function value;

  GeoMapPathMapLayersEvent({required this.value});
}
