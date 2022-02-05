import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mappy_stars/bloc/data/data_bloc.dart';
import 'package:mappy_stars/pages/tabs.dart';
import 'package:mappy_stars/pages/template.dart';
import 'constants/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    Jiffy.locale("ru");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataBloc>(
          create: (BuildContext context) => DataBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEDEEF1),
          primaryColor: const Color(0xFF4a5660),
          fontFamily: "Nunito",
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Color(0xFF4a5660)),
          ),
        ),
        initialRoute: Routes.Tabs,
        routes: {
          Routes.Tabs: (context) => const Tabs(),
          Routes.Template: (context) => const Template(),
        },
      ),
    );
  }
}
