part of 'save_bloc.dart';

@immutable
abstract class SaveEvent {}

class TemplateFileTypeIdSaveEvent extends SaveEvent {
  final int value;

  TemplateFileTypeIdSaveEvent({required this.value});
}

class GlobalKeyPreviewSaveEvent extends SaveEvent {
  final GlobalKey value;

  GlobalKeyPreviewSaveEvent({required this.value});
}
