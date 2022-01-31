import 'package:flutter/material.dart';

enum EShape { rounded, circle }

typedef ItemWidget<T> = Widget Function(T);

class ListVariants<T> extends StatefulWidget {
  final double height;
  final List<T> data;
  final ItemWidget<T> item;
  final EShape shape;
  final int activeIndex;

  const ListVariants(
      {Key? key,
      this.height = 60,
      required this.activeIndex,
      required this.data,
      required this.item,
      this.shape = EShape.rounded})
      : super(key: key);

  @override
  State<ListVariants<T>> createState() => _ListVariantsState<T>();
}

class _ListVariantsState<T> extends State<ListVariants<T>> {
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
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                shape: widget.shape == EShape.rounded
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: BorderSide(
                            color: widget.activeIndex == index ? const Color(0xFF4a5660) : Colors.transparent,
                            width: 2.0))
                    : CircleBorder(
                        side: BorderSide(
                            color: widget.activeIndex == index ? const Color(0xFF4a5660) : Colors.transparent,
                            width: 2.0)),
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(1.0),
                  clipBehavior: Clip.antiAlias,
                  shape: widget.shape == EShape.rounded
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: BorderSide(
                              color: widget.activeIndex == index
                                  ? Colors.transparent
                                  : const Color(0xFF4a5660).withOpacity(0.3),
                              width: 1.0))
                      : CircleBorder(
                          side: BorderSide(
                              color: widget.activeIndex == index
                                  ? Colors.transparent
                                  : const Color(0xFF4a5660).withOpacity(0.3),
                              width: 1.0)),
                  child: Container(
                      constraints: BoxConstraints(minWidth: widget.height), child: widget.item(widget.data[index])),
                ),
              ),
            );
          }),
    );
  }
}
