import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/pages/projects/edit_project.dart';
import 'package:start_in_mobile/pages/projects/project.dart';
import 'package:start_in_mobile/pages/projects/projects_home.dart';
import 'package:start_in_mobile/queries/projects/delete_project.dart';
import 'package:start_in_mobile/queries/projects/done_project.dart';
import 'package:start_in_mobile/queries/projects/publish_project.dart';

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
    final request = context.watch<CookieRequest>();

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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => EditProjectPage(
                                      projectId: widget.project.id))));
                        },
                        child: Text('Edit'),
                      ),
                    ),
                    Visibility(
                      visible: !widget.project.isPublished,
                      child: TextButton(
                        onPressed: () {
                          publishProject(request, widget.project.id);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProjectsPage())),
                          );
                        },
                        child: Text('Publish'),
                      ),
                    ),
                    Visibility(
                      visible: !widget.project.isPublished,
                      child: TextButton(
                        onPressed: () {
                          deleteProject(request, widget.project.id);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProjectsPage())),
                          );
                        },
                        child: Text('Delete'),
                      ),
                    ),
                    Visibility(
                      visible:
                          widget.project.isPublished && !widget.project.isDone,
                      child: TextButton(
                        onPressed: () {
                          doneProject(request, widget.project.id);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProjectsPage())),
                          );
                        },
                        child: Text('Done'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
