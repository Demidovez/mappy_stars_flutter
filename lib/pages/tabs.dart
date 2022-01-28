import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappy_stars/models/page_tab.dart';
import 'package:mappy_stars/pages/projects.dart';
import 'package:mappy_stars/pages/settings.dart';
import 'package:mappy_stars/pages/templates.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List<PageTab> _tabs = [
    PageTab("Шаблоны", const Templates()),
    PageTab("Мои проекты", const Projects()),
    PageTab("Настройки", const Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          return true;
        }
        setState(() {
          _currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              _tabs[_currentIndex].title,
              style: const TextStyle(
                color: Color(0xFF4a5660),
                fontWeight: FontWeight.w800,
                // fontSize: 20
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: _tabs[_currentIndex].page,
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/templates.svg',
                  color: _currentIndex == 0
                      ? const Color(0xFF4a5660)
                      : const Color(0xFFA2A6AA),
                  width: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/projects.svg',
                  color: _currentIndex == 1
                      ? const Color(0xFF4a5660)
                      : const Color(0xFFA2A6AA),
                  width: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    color: _currentIndex == 2
                        ? const Color(0xFF4a5660)
                        : const Color(0xFFA2A6AA),
                    width: 25,
                  ),
                  label: '')
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
