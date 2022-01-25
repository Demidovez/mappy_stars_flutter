import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  List templates = [];

  @override
  void initState() {
    super.initState();

    templates.addAll(
        ["Классика", "Полусфера", "Полароид", "Полная", "Под звездами"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "Шаблоны",
          style: TextStyle(color: Color(0xFF4a5660)),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        // centerTitle: true,
      ),
      body: const Center(child: Text("Шаблон")),
    );
  }
}
