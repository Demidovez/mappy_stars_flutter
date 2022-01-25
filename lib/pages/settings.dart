import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappy_stars/fragments/bottomnavigation.dart';

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
        ["Классика", "Полусфера", "Полароид", "Полная", "Под звездами"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "Настройки",
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
      bottomNavigationBar: const BottomNavigation(),
      body: Container(
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
      ),
    );
  }
}
