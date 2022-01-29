import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mappy_stars/constants/constants.dart';
import 'package:mappy_stars/models/project_card.dart';

class ProjectCardItem extends StatelessWidget {
  final ProjectCard project;

  const ProjectCardItem({Key? key, required this.project}) : super(key: key);

  void goToProject(BuildContext context) {
    Navigator.pushNamed(context, Routes.Template);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToProject(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: Image(image: AssetImage('assets/images/' + project.imageName))),
                Expanded(
                  flex: 4,
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
                              project.title,
                              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(project.desc),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Opacity(
                            opacity: 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.location,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  // DateFormat('yyyy-MM-dd – kk:mm').format(project.date),
                                  Jiffy(project.date).format("dd MMMM yyyy, hh:mm"),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
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
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}

class DateFormat {}
