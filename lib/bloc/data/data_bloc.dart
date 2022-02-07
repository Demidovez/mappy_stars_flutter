import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mappy_stars/models/holst.dart';

import '../../models/template_file_type.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataState()) {
    on<HolstsDataEvent>((event, emit) {
      emit(state.copyWith(holsts: event.value));
    });
    on<HolstColorsDataEvent>((event, emit) {
      emit(state.copyWith(colorsHolst: event.value));
    });
    on<HolstBorderColorsDataEvent>((event, emit) {
      emit(state.copyWith(colorsBorder: event.value));
    });
    on<TemplateFileTypesDataEvent>((event, emit) {
      emit(state.copyWith(templateFileTypes: event.value));
    });
  }
}
