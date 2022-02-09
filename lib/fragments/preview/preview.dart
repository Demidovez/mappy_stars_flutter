import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mappy_stars/bloc/controllers/save/save_bloc.dart';
import '../preview/holst.dart';
import '../preview/location.dart';
import '../preview/desc.dart';
import '../preview/mapstar.dart';
import '../preview/separator.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    context.read<SaveBloc>().add(GlobalKeyPreviewSaveEvent(value: _globalKey));
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Holst(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MapStar(),
                  // Desc(),
                  // Separator(),
                  // Location(),
                ],
              )
            ],
          )),
    );
  }
}
