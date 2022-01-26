import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List templates = [];

  @override
  void initState() {
    super.initState();

    templates.addAll(
        ["Настройки", "Настройки", "Настройки", "Настройки", "Настройки"]);
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
                            Navigator.pushNamed(context, '/template');
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
