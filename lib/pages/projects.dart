import 'package:flutter/material.dart';
import 'package:mappy_stars/fragments/project_card_item.dart';
import 'package:mappy_stars/models/project_card.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<ProjectCard> projects = [];

  @override
  void initState() {
    super.initState();

    projects.addAll([
      ProjectCard("Маме на ДР", "classic_v1", "Возможность изменять размеры карты", "classic_v1.jpeg", "Москва, Россия",
          DateTime.now()),
      ProjectCard("Новый год", "half_v1", "Изменение высоты полусферы", "half_v1.jpeg", "д. Нижние Устюки, Россия",
          DateTime.now()),
      ProjectCard("Проверка", "polaroid_v1", "Возможность изменять отступ карты и ее высоту", "polaroid_v1.jpeg",
          "Минск, Беларусь", DateTime.now()),
      ProjectCard("Полная", "full_v1", "Различный выбор цвета и размера блока с текстом", "full_v1.jpeg",
          "Москва, Россия", DateTime.now()),
      ProjectCard("С картинкой", "understars_v1", "Выбор изображений для фона из списка", "understars_v1.jpeg",
          "Гродно, Россия", DateTime.now())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.fromLTRB(20, index == 0 ? 20 : 0, 20, 20),
                child: ProjectCardItem(project: projects[index]));
          }),
    );
  }
}
