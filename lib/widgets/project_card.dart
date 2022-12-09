import 'package:start_in_mobile/models/project.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  Project project;
  ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isLiked = false;

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
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      widget.project.username,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      '${widget.project.timeCreated}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text('Like'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
