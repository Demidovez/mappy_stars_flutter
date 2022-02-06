import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mappy_stars/bloc/controllers/canvas_v1/canvas_bloc.dart';
import 'package:mappy_stars/bloc/data/data_bloc.dart';
import 'package:mappy_stars/models/holst.dart';

import '../color_item.dart';
import '../holst_item.dart';
import '../label.dart';
import '../label_check_box.dart';
import '../list_variants.dart';
import '../slider_percentage.dart';

class CanvasV1Controller extends StatelessWidget {
  const CanvasV1Controller({Key? key}) : super(key: key);

  void setHolstIdCanvas(int id, BuildContext context) {
    context.read<CanvasBloc>().add(HolstIdCanvasEvent(value: id));
  }

  void setHolstColorCanvas(Color color, BuildContext context) {
    context.read<CanvasBloc>().add(HolstColorCanvasEvent(value: color));
  }

  void setHasBorderCanvas(bool has, BuildContext context) {
    context.read<CanvasBloc>().add(HasBorderCanvasEvent(value: has));
  }

  void setIndentBorder(double indent, BuildContext context) {
    context.read<CanvasBloc>().add(IndentBorderCanvasEvent(value: indent));
  }

  void setSizeBorder(double size, BuildContext context) {
    context.read<CanvasBloc>().add(SizeBorderCanvasEvent(value: size));
  }

  void setColorBorder(Color color, BuildContext context) {
    context.read<CanvasBloc>().add(ColorBorderCanvasEvent(value: color));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label("Размер холста"),
        BlocSelector<CanvasBloc, CanvasState, int>(
          selector: (state) {
            return state.holstId;
          },
          builder: (context, state) {
            List<Holst> _holsts = context.select((DataBloc bloc) => bloc.state.holsts);

            return ListVariants<Holst>(
                data: _holsts,
                activeIndex: state,
                item: (holst) => HolstItem(holst, setHolstIdCanvas));
          },
        ),
        const Label("Цвет фона"),
        BlocSelector<CanvasBloc, CanvasState, Color>(
          selector: (state) {
            return state.holstColor;
          },
          builder: (context, state) {
            List<Color> _colorsHolst = context.select((DataBloc bloc) => bloc.state.colorsHolst);

            return ListVariants<Color>(
                height: 50,
                shape: EShape.circle,
                data: _colorsHolst,
                activeIndex: _colorsHolst.indexOf(state),
                item: (color) => ColorItem(color, setHolstColorCanvas));
          },
        ),
        BlocSelector<CanvasBloc, CanvasState, bool>(
          selector: (state) {
            return state.hasBorderCanvas;
          },
          builder: (context, state) {
            return LabelCheckBox("Добавить рамку", value: state, onChange: setHasBorderCanvas);
          },
        ),
        const Label("Отступ для рамки"),
        BlocSelector<CanvasBloc, CanvasState, double>(
          selector: (state) {
            return state.indentBorder;
          },
          builder: (context, state) {
            return SliderPercentage(value: state, onChange: setIndentBorder);
          },
        ),
        const Label("Размер рамки"),
        BlocSelector<CanvasBloc, CanvasState, double>(
          selector: (state) {
            return state.sizeBorder;
          },
          builder: (context, state) {
            return SliderPercentage(value: state, onChange: setSizeBorder);
          },
        ),
        const Label("Цвет рамки"),
        BlocSelector<CanvasBloc, CanvasState, Color>(
          selector: (state) {
            return state.holstBorderColor;
          },
          builder: (context, state) {
            List<Color> _colorsBorder = context.select((DataBloc bloc) => bloc.state.colorsBorder);

            return ListVariants<Color>(
                height: 50,
                shape: EShape.circle,
                data: _colorsBorder,
                activeIndex: _colorsBorder.indexOf(state),
                item: (color) => ColorItem(color, setColorBorder));
          },
        )
      ],
    );
  }
}
