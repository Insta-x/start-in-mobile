import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/pages/projects/project.dart';
import 'package:start_in_mobile/pages/projects/widgets/project_like_button.dart';

class UserProjectCard extends StatefulWidget {
  Project project;
  UserProjectCard({super.key, required this.project});

  @override
  State<UserProjectCard> createState() => _UserProjectCardState();
}

class _UserProjectCardState extends State<UserProjectCard> {
  @override
  void initState() {
    super.initState();
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
                    ),
                    const SizedBox(height: 10.0),
                    Text.rich(
                      TextSpan(
                        text: '${widget.project.currentDonation}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' / ${widget.project.donationTarget}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: !widget.project.isPublished,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Edit'),
                      ),
                    ),
                    Visibility(
                      visible: !widget.project.isPublished,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Publish'),
                      ),
                    ),
                    Visibility(
                      visible: !widget.project.isPublished,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Delete'),
                      ),
                    ),
                    Visibility(
                      visible:
                          widget.project.isPublished && !widget.project.isDone,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Done'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectPage(project: widget.project),
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
