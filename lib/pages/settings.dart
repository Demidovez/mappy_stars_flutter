import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mappy_stars/models/setting_link.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<SettingLink> links = [];

  @override
  void initState() {
    super.initState();

    links.addAll([
      SettingLink("Сообщить о проблеме", "has_problem", "problem.svg"),
      SettingLink("Поделиться с друзьями", "share", "share.svg"),
      SettingLink("Оставить отзыв", "review", "review.svg"),
      SettingLink("Политика конфиденциальности", "policy", "policy.svg"),
      SettingLink("Наш телеграм", "has_problem", "telegram.svg", false)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      color: Colors.white,
      child: ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: links.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => {},
                splashColor: const Color(0x334a5660),
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: SvgPicture.asset(
                          'assets/icons/' + links[index].iconName,
                          color: links[index].isChangeColorIcon
                              ? const Color(0xFF4a5660)
                              : null,
                          width: 25,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          links[index].title,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
