import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mappy_stars/bloc/data/data_bloc.dart';
import 'package:mappy_stars/models/holst.dart';

import '../../bloc/controllers/map/map_bloc.dart';
import '../color_item.dart';
import '../holst_item.dart';
import '../label.dart';
import '../list_variants.dart';
import '../slider_percentage.dart';

class MapV1Controller extends StatelessWidget {
  const MapV1Controller({Key? key}) : super(key: key);

  void setShapeIdBorder(int id, BuildContext context) {
    context.read<MapBloc>().add(ShapeBorderIdMapEvent(value: id));
  }

  void setColor(Color color, BuildContext context) {
    context.read<MapBloc>().add(ColorMapEvent(value: color));
  }

  void setIndentMap(double indent, BuildContext context) {
    context.read<MapBloc>().add(IndentMapEvent(value: indent));
  }

  void setSizeMap(double size, BuildContext context) {
    context.read<MapBloc>().add(SizeMapEvent(value: size));
  }

  void setColorBorder(Color color, BuildContext context) {
    context.read<MapBloc>().add(ColorBorderMapEvent(value: color));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label("Размер карты"),
        BlocSelector<MapBloc, MapState, double>(
          selector: (state) {
            return state.sizeMap;
          },
          builder: (context, state) {
            return SliderPercentage(value: state, onChange: setSizeMap);
          },
        ),
        const Label("Отступ карты"),
        BlocSelector<MapBloc, MapState, double>(
          selector: (state) {
            return state.indentMap;
          },
          builder: (context, state) {
            return SliderPercentage(value: state, onChange: setIndentMap);
          },
        ),
        const Label("Цвет фона"),
        BlocSelector<MapBloc, MapState, Color>(
          selector: (state) {
            return state.color;
          },
          builder: (context, state) {
            List<Color> _colorsHolst = context.select((DataBloc bloc) => bloc.state.colorsHolst);

            return ListVariants<Color>(
                height: 50,
                shape: EShape.circle,
                data: _colorsHolst,
                activeIndex: _colorsHolst.indexOf(state),
                item: (color) => ColorItem(color, setColor));
          },
        ),
        const Label("Форма рамки"),
        BlocSelector<MapBloc, MapState, int>(
          selector: (state) {
            return state.shapeBorderId;
          },
          builder: (context, state) {
            List<Holst> _holsts = context.select((DataBloc bloc) => bloc.state.holsts);

            return ListVariants<Holst>(
                data: _holsts,
                activeIndex: state,
                item: (holst) => HolstItem(holst, setShapeIdBorder));
          },
        ),
        const Label("Цвет рамки"),
        BlocSelector<MapBloc, MapState, Color>(
          selector: (state) {
            return state.colorBorder;
          },
          builder: (context, state) {
            List<Color> _colorsHolst = context.select((DataBloc bloc) => bloc.state.colorsHolst);

            return ListVariants<Color>(
                height: 50,
                shape: EShape.circle,
                data: _colorsHolst,
                activeIndex: _colorsHolst.indexOf(state),
                item: (color) => ColorItem(color, setColorBorder));
          },
        ),
      ],
    );
  }
}
