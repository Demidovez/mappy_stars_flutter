import 'package:flutter/material.dart';
import 'package:mappy_stars/constants/constants.dart';
import 'package:mappy_stars/models/template_card.dart';

class TemplateCardItem extends StatelessWidget {
  final TemplateCard template;

  const TemplateCardItem({Key? key, required this.template}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Image(
                      image:
                          AssetImage('assets/images/' + template.imageName))),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            template.title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(template.desc),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.Template);
                          },
                          child: const Text('Создать'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF5bc3f1),
                            elevation: 0,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }
}
