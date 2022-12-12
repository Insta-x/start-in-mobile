import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:intl/intl.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';
import 'package:start_in_mobile/queries/projects/fetch_projects.dart';
import 'package:start_in_mobile/pages/projects/donate_project.dart';
import 'package:start_in_mobile/pages/projects/widgets/project_like_button.dart';

class ProjectPage extends StatefulWidget {
  final int projectId;
  const ProjectPage({super.key, required this.projectId});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  Future<Project>? _project;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Project'),
        backgroundColor: Color.fromARGB(255, 10, 13, 170),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      body: FutureBuilder<Project>(
        future: fetchProject(request, widget.projectId),
        builder: (BuildContext context, AsyncSnapshot<Project> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20.0),
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
                              snapshot.data!.title,
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(
                              snapshot.data!.username,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 118, 118, 118)),
                            ),
                            Text(
                              DateFormat.yMMMMd('en_US')
                                  .format(snapshot.data!.timeCreated),
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 118, 118, 118)),
                            ),
                            const SizedBox(height: 10.0),
                            Text.rich(
                              TextSpan(
                                text: '${snapshot.data!.currentDonation}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' / ${snapshot.data!.donationTarget}',
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
                              projectId: snapshot.data!.id,
                              likeCount: snapshot.data!.likeCount,
                              isLiked: snapshot.data!.isLiked,
                            ),
                            Visibility(
                              visible: !snapshot.data!.isDone,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: request.loggedIn
                                      ? Colors.blue
                                      : Colors.amber,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => request.loggedIn
                                          ? DonateProjectPage(
                                              projectId: snapshot.data!.id)
                                          : const LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  request.loggedIn
                                      ? 'Donate'
                                      : 'Login to donate',
                                ),
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
                      snapshot.data!.description,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Retrieving Data...'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
