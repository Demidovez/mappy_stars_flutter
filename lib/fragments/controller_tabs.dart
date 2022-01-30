import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mappy_stars/models/controller_tab.dart';

import 'controllers/canvas_v1.dart';
import 'controllers/event_v1.dart';
import 'controllers/save_v1.dart';

class ControllerTabs extends StatefulWidget {
  const ControllerTabs({Key? key}) : super(key: key);

  @override
  _ControllerTabsState createState() => _ControllerTabsState();
}

class _ControllerTabsState extends State<ControllerTabs> with SingleTickerProviderStateMixin {
  List<ControllerTab> tabs = [];

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabs.addAll([
      ControllerTab("Событие", "event_tab.svg", () => const EventV1Controller()),
      ControllerTab("Холст", "canvas_tab.svg", () => const CanvasV1Controller()),
      ControllerTab("Карта", "map_tab.svg", () => const EventV1Controller()),
      ControllerTab("Звезды", "stars_tab.svg", () => const EventV1Controller()),
      ControllerTab("Текст", "desc_tab.svg", () => const EventV1Controller()),
      ControllerTab("Разделитель", "separator_tab.svg", () => const EventV1Controller()),
      ControllerTab("Локация", "location_tab.svg", () => const EventV1Controller()),
      ControllerTab("Сохранение", "save_tab.svg", () => const SaveV1Controller())
    ]);

    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const iconHeight = 20.0;
    const verticalPaddingBar = 5.0;
    const heightBar = iconHeight + 2 * verticalPaddingBar + 4.0;

    const activeColor = Color(0xFF4a5660);
    const unactiveColor = Color(0x884a5660);

    return Container(
      color: Colors.transparent,
      child: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(bottom: BorderSide(color: Colors.white, width: 2)),
                ),
                child: TabBar(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: activeColor,
                  unselectedLabelColor: unactiveColor,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorWeight: 2.0,
                  indicator: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  tabs: tabs.asMap().entries.map((entry) {
                    int index = entry.key;
                    ControllerTab tab = entry.value;

                    return Tab(
                        height: heightBar,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: verticalPaddingBar, horizontal: 12.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/' + tab.iconName,
                                color: _selectedIndex == index ? activeColor : unactiveColor,
                                width: iconHeight,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                tab.title,
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ));
                  }).toList(),
                )),
            Expanded(
              child: Container(
                color: Colors.white,
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: tabs
                        .map((tab) => SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: tab.controller(),
                            ))
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
