import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/pages/projects/widgets/project_card.dart';
import 'package:start_in_mobile/queries/projects/fetch_projects.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  // List<Project> dummyProjects = [
  //   Project(
  //       username: 'username',
  //       timeCreated: DateTime.parse('2022-12-09'),
  //       title: 'title',
  //       description: 'description',
  //       donationTarget: 100,
  //       currentDonation: 10,
  //       likeCount: 1,
  //       isPublished: true,
  //       isDone: false,
  //       isLiked: true),
  //   Project(
  //       username: 'username2',
  //       timeCreated: DateTime.parse('2022-12-10'),
  //       title: 'title2',
  //       description: 'description',
  //       donationTarget: 100,
  //       currentDonation: 10,
  //       likeCount: 1,
  //       isPublished: true,
  //       isDone: false,
  //       isLiked: true)
  // ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Project>>(
        future: fetchProjects(request, ''),
        builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = snapshot.data!
                .map((project) => ProjectCard(project: project))
                .toList();
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
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
          return SingleChildScrollView(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: children,
              ),
            ),
          );
        },
      ),
    );
  }
}
