import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc()
      : super(MapState(
          sizeMap: 10,
          indentMap: 10,
          color: Colors.black,
          shapeBorderId: 1,
          colorBorder: Colors.red,
        )) {
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
  }
}
