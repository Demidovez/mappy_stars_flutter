part of 'data_bloc.dart';

class DataState {
  final List<Holst> holsts;
  final List<Color> colorsHolst;
  final List<Color> colorsBorder;
  final List<TemplateFileType> templateFileTypes;

  // ignore: todo
  // TODO: Перенести дефолтные значение в API
  DataState(
      {this.holsts = const [
        Holst(0, "A4", "210 x 297 мм", 2480.0, 3508.0),
        Holst(1, "A3", "297 x 420 мм", 3508.0, 4961.0),
        Holst(2, "A2", "420 x 594 мм", 4961.0, 7016.0),
        Holst(3, "A1", "594 x 841 мм", 7016.0, 9933.0)
      ],
      this.colorsHolst = const [
        Colors.transparent,
        Color(0xFF000000),
        Color(0xFFFFFFFF),
        Color(0xFF1ABC9C),
        Color(0xFF16A085),
        Color(0xFF2ECC71),
        Color(0xFF27AE60),
        Color(0xFF3498DB),
        Color(0xFF2980B9),
        Color(0xFF9B59B6),
        Color(0xFF8E44AD),
        Color(0xFF34495E),
        Color(0xFF2C3E50),
        Color(0xFFF1C40F),
        Color(0xFFF39C12),
        Color(0xFFE67E22),
        Color(0xFFD35400),
        Color(0xFFE74C3C),
        Color(0xFFC0392B),
        Color(0xFFBDC3C7),
        Color(0xFF95A5A6),
        Color(0xFF7F8C8D)
      ],
      this.colorsBorder = const [
        Colors.transparent,
        Color(0xFF000000),
        Color(0xFFFFFFFF),
        Color(0xFF1ABC9C),
        Color(0xFF16A085),
        Color(0xFF2ECC71),
        Color(0xFF27AE60),
        Color(0xFF3498DB),
        Color(0xFF2980B9),
        Color(0xFF9B59B6),
        Color(0xFF8E44AD),
        Color(0xFF34495E),
        Color(0xFF2C3E50),
        Color(0xFFF1C40F),
        Color(0xFFF39C12),
        Color(0xFFE67E22),
        Color(0xFFD35400),
        Color(0xFFE74C3C),
        Color(0xFFC0392B),
        Color(0xFFBDC3C7),
        Color(0xFF95A5A6),
        Color(0xFF7F8C8D)
      ],
      this.templateFileTypes = const [TemplateFileType(0, "JPG"), TemplateFileType(1, "PDF")]});

  DataState copyWith(
      {List<Holst>? holsts,
      List<Color>? colorsHolst,
      List<Color>? colorsBorder,
      List<TemplateFileType>? templateFileTypes}) {
    return DataState(
      holsts: holsts ?? this.holsts,
      colorsHolst: colorsHolst ?? this.colorsHolst,
      colorsBorder: colorsBorder ?? this.colorsBorder,
      templateFileTypes: templateFileTypes ?? this.templateFileTypes,
    );
  }
}
