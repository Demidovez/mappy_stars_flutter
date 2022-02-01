import 'package:flutter/material.dart';

typedef Callback = void Function(double value);

class SliderPercentage extends StatefulWidget {
  final double value;
  final Callback onChange;

  const SliderPercentage({Key? key, required this.value, required this.onChange}) : super(key: key);

  @override
  State<SliderPercentage> createState() => _SliderPercentageState();
}

class _SliderPercentageState extends State<SliderPercentage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0, top: 0.0, bottom: 0.0),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xFFEDEEF1),
              ),
              width: 45,
              height: 35,
              child: Center(
                child: Text(
                  widget.value.round().toString(),
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              )),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
              ),
              child: Slider(
                value: widget.value,
                min: 0.0,
                max: 100.0,
                activeColor: const Color(0xFF4a5660),
                inactiveColor: const Color(0xFF4a5660).withOpacity(0.2),
                label: widget.value.round().toString(),
                onChanged: (double value) => widget.onChange(value),
              ),
            ),
          )
        ],
      ),
    );
  }
}
