import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/courses_data.dart';
import '../../queries/fetch_courses.dart';
import '../../widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<AddedCourse>? courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Courses"),
            backgroundColor: Color.fromARGB(255, 212, 147, 6)),
        drawer: const AppDrawer(),
        body: FutureBuilder(
            future: CoursesApi.getCourse(),
            builder: (context, snapshot) {
              final courses = snapshot.data;
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada events :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () async {
                            final course = courses[index];
                            String url = course.fields!.courseUrl!;
                            Uri linkUrl = Uri.parse(url);
                            // ignore: deprecated_member_use
                            if (linkUrl.isAbsolute) {
                              // ignore: deprecated_member_use
                              await launchUrl(linkUrl);
                            } else {
                              throw 'Could not launch url';
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Judul Event
                                Text(
                                  courses![index].fields!.courseName!,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Jarak line spacing
                                Text(
                                  "",
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Jadwal event
                                Text(
                                  courses![index].fields!.courseUrl!,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
