import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:intl/intl.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';
import 'package:start_in_mobile/pages/projects/donate_project.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/pages/projects/widgets/project_like_button.dart';

class ProjectPage extends StatefulWidget {
  final Project project;
  const ProjectPage({super.key, required this.project});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO : reload button for project page
            },
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      ProjectLikeButton(
                        projectId: widget.project.id,
                        likeCount: widget.project.likeCount,
                        isLiked: widget.project.isLiked,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => request.loggedIn
                                  ? DonatePage(projectId: widget.project.id)
                                  : const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          request.loggedIn ? 'Donate' : 'Login to donate',
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                widget.project.description,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
