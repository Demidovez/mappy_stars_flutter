part of 'save_bloc.dart';

class SaveState {
  final int templateFileTypeId;
  final GlobalKey globalKeyPreview;

  SaveState({required this.templateFileTypeId, required this.globalKeyPreview});

  SaveState copyWith({int? templateFileTypeId, GlobalKey? globalKeyPreview}) {
    return SaveState(
      templateFileTypeId: templateFileTypeId ?? this.templateFileTypeId,
      globalKeyPreview: globalKeyPreview ?? this.globalKeyPreview,
    );
  }
}
