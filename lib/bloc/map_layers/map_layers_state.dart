part of 'map_layers_bloc.dart';

class MapLayersState {
  final Function geoMapPath;

  MapLayersState({required this.geoMapPath});

  MapLayersState copyWith({Function? geoMapPath}) {
    return MapLayersState(geoMapPath: geoMapPath ?? this.geoMapPath);
  }
}
