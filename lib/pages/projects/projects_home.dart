import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/models/project.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';
import 'package:start_in_mobile/pages/projects/create_project.dart';
import 'package:start_in_mobile/pages/projects/widgets/user_project_card.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/pages/projects/widgets/project_card.dart';
import 'package:start_in_mobile/queries/projects/fetch_projects.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with TickerProviderStateMixin {
  final _searchFormKey = GlobalKey<FormState>();
  String searchQuery = '';

  Future<List<Project>>? _projects;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Color.fromARGB(255, 10, 13, 170),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.featured_play_list_outlined),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          FutureBuilder<List<Project>>(
            initialData: [],
            future: _projects ?? fetchProjects(request, ''),
            builder:
                (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = snapshot.data!
                    .map((project) => ProjectCard(project: project))
                    .toList();
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
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Form(
                        key: _searchFormKey,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String? value) {
                                  searchQuery = value ?? '';
                                },
                                onSaved: (String? value) {
                                  searchQuery = value ?? '';
                                },
                                validator: (String? value) {
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () async {
                                  if (_searchFormKey.currentState!.validate()) {
                                    setState(() {
                                      _projects =
                                          fetchProjects(request, searchQuery);
                                    });
                                  }
                                },
                                child: const Text(
                                  "Search",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: children,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          FutureBuilder<List<Project>>(
            future: request.loggedIn ? fetchUserProjects(request) : null,
            builder:
                (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
              List<Widget> children;
              if (!request.loggedIn) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create New Project',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Propose an innovative project that will increase the life quality of everyone.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.amber,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LoginPage())));
                          },
                          child: Text(
                            'Login to create project',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.hasData) {
                children = snapshot.data!
                    .map((project) => UserProjectCard(project: project))
                    .toList();
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
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              CreateProjectPage())));
                                },
                                child: Text(
                                  'Create New Project',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: children,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
