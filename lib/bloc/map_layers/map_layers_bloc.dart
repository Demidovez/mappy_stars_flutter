import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'map_layers_event.dart';
part 'map_layers_state.dart';

class MapLayersBloc extends Bloc<MapLayersEvent, MapLayersState> {
  MapLayersBloc() : super(MapLayersState(geoMapPath: () => {})) {
    on<GeoMapPathMapLayersEvent>((event, emit) {
      emit(state.copyWith(geoMapPath: event.value));
    });
  }
}
