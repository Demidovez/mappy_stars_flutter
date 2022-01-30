import 'package:flutter/material.dart';

typedef ItemWidget<T> = Widget Function(T);

class ListVariants<T> extends StatefulWidget {
  final double height;
  final List<T> data;
  final ItemWidget<T> item;

  const ListVariants({Key? key, this.height = 60, required this.data, required this.item}) : super(key: key);

  @override
  State<ListVariants<T>> createState() => _ListVariantsState<T>();
}

class _ListVariantsState<T> extends State<ListVariants<T>> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height + 2,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 16.0, top: 2, bottom: 2),
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () => setState(() {
                  _activeIndex = index;
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: _activeIndex == index ? const Color(0xFF4a5660) : Colors.transparent, width: 1.0)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                            color: _activeIndex == index ? const Color(0xFF4a5660) : const Color(0xFFBEC5CA),
                            width: 1.0)),
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    constraints: BoxConstraints(minWidth: widget.height),
                    child: widget.item(widget.data[index]),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
