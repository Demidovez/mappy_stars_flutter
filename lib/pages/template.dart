import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mappy_stars/bloc/controllers/canvas/canvas_bloc.dart';
import 'package:mappy_stars/fragments/controller_tabs.dart';
import 'package:mappy_stars/fragments/preview.dart';

import '../bloc/controllers/save/save_bloc.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  List templates = [];

  @override
  Widget build(BuildContext context) {
    const widthHoslt = 2480;
    const heightHoslt = 3508;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFEDEEF1),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CanvasBloc>(
            create: (BuildContext context) => CanvasBloc(),
          ),
          BlocProvider<SaveBloc>(
            create: (BuildContext context) => SaveBloc(),
          ),
        ],
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 16.0),
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        builder: (ctx, constraints) {
                          return Center(
                            child: Container(
                                height: constraints.maxHeight,
                                width: constraints.maxHeight * (widthHoslt / heightHoslt),
                                color: Colors.white,
                                child: const Preview()),
                          );
                        },
                      ),
                      Positioned(
                          child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/arrow_back.svg',
                            color: const Color(0xFF4a5660),
                            width: 25,
                          ),
                        ),
                      ))
                    ],
                  ),
                )),
            const Expanded(flex: 4, child: ControllerTabs())
          ],
        ),
      ),
    );
  }
}
