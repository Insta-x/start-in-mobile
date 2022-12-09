import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start_in_mobile/models/project.dart';

class ProjectCard extends StatefulWidget {
  Project project;
  ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    isLiked = widget.project.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      widget.project.username,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 118, 118, 118)),
                    ),
                    Text(
                      DateFormat.yMMMMd('en_US')
                          .format(widget.project.timeCreated),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 118, 118, 118)),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up_outlined),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
