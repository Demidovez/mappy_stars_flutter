import 'package:flutter/material.dart';

import '../label_input.dart';

class EventV1Controller extends StatefulWidget {
  const EventV1Controller({Key? key}) : super(key: key);

  @override
  _EventV1ControllerState createState() => _EventV1ControllerState();
}

class _EventV1ControllerState extends State<EventV1Controller> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(
                flex: 3,
                child: LabelInput(
                  label: "Дата",
                  value: "27 января 2022г",
                  type: EType.left,
                )),
            Expanded(
                flex: 2,
                child: LabelInput(
                  label: "Время",
                  value: "22:42",
                  type: EType.right,
                )),
          ],
        ),
        const LabelInput(label: "Место, где произошло событие", value: "Москва, Россия"),
        Row(
          children: const [
            Expanded(
                child: LabelInput(
              label: "Широта",
              value: "55.755825",
              type: EType.left,
            )),
            Expanded(
                child: LabelInput(
              label: "Долгота",
              value: "37.617298",
              type: EType.right,
            )),
          ],
        ),
      ],
    );
  }
}
