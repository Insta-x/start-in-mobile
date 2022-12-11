import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/pages/projects/project.dart';
import 'package:start_in_mobile/pages/projects/widgets/project_like_button.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // if you need this
        side: BorderSide(
          color: widget.project.isDone ? Colors.green : Colors.grey,
          width: 1,
        ),
      ),
      color: widget.project.isDone ? Colors.lightGreen[50] : Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
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
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
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
                    ),
                    const SizedBox(height: 10.0),
                    Text.rich(
                      TextSpan(
                        text: 'Rp${widget.project.currentDonation}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' / Rp${widget.project.donationTarget}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ProjectLikeButton(
                  projectId: widget.project.id,
                  likeCount: widget.project.likeCount,
                  isLiked: widget.project.isLiked,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProjectPage(projectId: widget.project.id),
                  ),
                );
              },
              child: const Text('Read More'),
            )
          ],
        ),
      ),
    );
  }
}
