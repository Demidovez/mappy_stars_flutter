import 'package:flutter/material.dart';
import 'package:mappy_stars/fragments/template_card_item.dart';
import 'package:mappy_stars/models/template_card.dart';

class Templates extends StatefulWidget {
  const Templates({Key? key}) : super(key: key);

  @override
  State<Templates> createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  List<TemplateCard> templates = [];

  @override
  void initState() {
    super.initState();

    templates.addAll([
      TemplateCard("Классика", "classic_v1", "Возможность изменять размеры карты", "classic_v1.jpeg"),
      TemplateCard("Полусфера", "half_v1", "Изменение высоты полусферы", "half_v1.jpeg"),
      TemplateCard("Полароид", "polaroid_v1", "Возможность изменять отступ карты и ее высоту", "polaroid_v1.jpeg"),
      TemplateCard("Полная", "full_v1", "Различный выбор цвета и размера блока с текстом", "full_v1.jpeg"),
      TemplateCard("Под звездами", "understars_v1", "Выбор изображений для фона из списка", "understars_v1.jpeg")
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
          itemCount: templates.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.fromLTRB(20, index == 0 ? 20 : 0, 20, 20),
                child: TemplateCardItem(template: templates[index]));
          }),
    );
  }
}
