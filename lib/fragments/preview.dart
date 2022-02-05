import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mappy_stars/bloc/controllers/canvas_v1/canvas_bloc.dart';

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = "27 января 2022 г.";
    String time = "22:42";
    String location = "Москва, Россия";
    String latitude = "55.232341";
    String longtitude = "34.444444";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Дата: ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Время: ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              time,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Место: ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              location,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Широта: ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              latitude,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Долгота: ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              longtitude,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Холст: ",
              style: TextStyle(fontSize: 10),
            ),
            BlocSelector<CanvasBloc, CanvasState, int>(
              selector: (state) {
                return state.holstId;
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Цвет холста: ",
              style: TextStyle(fontSize: 10),
            ),
            BlocSelector<CanvasBloc, CanvasState, Color>(
              selector: (state) {
                return state.holstColor;
              },
              builder: (context, state) {
                return Container(
                  color: state,
                  width: 50,
                  height: 8,
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Добавить рамку холста: ",
              style: TextStyle(fontSize: 10),
            ),
            BlocSelector<CanvasBloc, CanvasState, bool>(
              selector: (state) {
                return state.hasBorderCanvas;
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Отступ рамки холста: ",
              style: TextStyle(fontSize: 10),
            ),
            BlocSelector<CanvasBloc, CanvasState, double>(
              selector: (state) {
                return state.indentBorder;
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Размер рамки холста: ",
              style: TextStyle(fontSize: 10),
            ),
            BlocSelector<CanvasBloc, CanvasState, double>(
              selector: (state) {
                return state.sizeBorder;
              },
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Цвет рамки холста: ",
              style: TextStyle(fontSize: 10),
            ),
            BlocSelector<CanvasBloc, CanvasState, Color>(
              selector: (state) {
                return state.holstBorderColor;
              },
              builder: (context, state) {
                return Container(
                  color: state,
                  width: 50,
                  height: 8,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
