import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:start_in_mobile/widgets/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<Project> dummyProjects = [
    Project(
        username: 'username',
        timeCreated: DateTime.parse('2022-12-09'),
        title: 'title',
        description: 'description',
        donationTarget: 100,
        currentDonation: 10,
        likeCount: 1,
        isPublished: true,
        isDone: false,
        isLiked: true),
    Project(
        username: 'username2',
        timeCreated: DateTime.parse('2022-12-10'),
        title: 'title2',
        description: 'description',
        donationTarget: 100,
        currentDonation: 10,
        likeCount: 1,
        isPublished: true,
        isDone: false,
        isLiked: true)
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            children: dummyProjects
                .map((project) => ProjectCard(project: project))
                .toList(),
          )),
    );
  }
}
