import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'canvas_event.dart';
part 'canvas_state.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc()
      : super(CanvasState(
          holstId: 0,
          holstColor: const Color(0xFFFFFFFF),
          hasBorderCanvas: true,
          indentBorder: 15,
          sizeBorder: 3,
          holstBorderColor: const Color(0xFF000000),
        )) {
    on<HolstIdCanvasEvent>((event, emit) {
      emit(state.copyWith(holstId: event.value));
    });
    on<HolstColorCanvasEvent>((event, emit) {
      emit(state.copyWith(holstColor: event.value));
    });
    on<HasBorderCanvasEvent>((event, emit) {
      emit(state.copyWith(hasBorderCanvas: event.value));
    });
    on<IndentBorderCanvasEvent>((event, emit) {
      emit(state.copyWith(indentBorder: event.value));
    });
    on<SizeBorderCanvasEvent>((event, emit) {
      emit(state.copyWith(sizeBorder: event.value));
    });
    on<ColorBorderCanvasEvent>((event, emit) {
      emit(state.copyWith(holstBorderColor: event.value));
    });
  }
}
