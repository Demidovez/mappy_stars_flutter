import 'package:flutter/material.dart';
import 'package:mappy_stars/constants/constants.dart';

class Templates extends StatefulWidget {
  const Templates({Key? key}) : super(key: key);

  @override
  State<Templates> createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  List templates = [];

  @override
  void initState() {
    super.initState();

    templates.addAll(
        ["Классика", "Полусфера", "Полароид", "Полная", "Под звездами"]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: templates.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        Text(templates[index]),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.Template);
                          },
                          child: const Text('Enabled'),
                        )
                      ],
                    ),
                  ),
                  elevation: 0,
                ));
          }),
    );
  }
}
