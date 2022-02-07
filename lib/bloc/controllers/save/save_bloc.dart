import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(SaveState(templateFileTypeId: 0, globalKeyPreview: GlobalKey())) {
    on<TemplateFileTypeIdSaveEvent>((event, emit) {
      emit(state.copyWith(templateFileTypeId: event.value));
    });
    on<GlobalKeyPreviewSaveEvent>((event, emit) {
      emit(state.copyWith(globalKeyPreview: event.value));
    });
  }
}
