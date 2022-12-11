import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/courses_data.dart';
import '../../queries/fetch_courses.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  late List<AddedCourse> courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<AddedCourse>>(
            future: CoursesApi.getCourse(),
            builder: (context, snapshot) {
              final courses = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Error Occurred!'));
                  } else {
                    return Container();
                    //itemBuilder: (context, index) => GestureDetector()
                  }
              }
            }));
  }
}

    //             return .builder(
    //               physics: BouncingScrollPhysics(),
    //               itemCount: courses?.length,
    //               final course = courses![index];
                  
    //               itemBuilder: (context, index) => GestureDetector(
    //                 onTap: () async {
    //                   if (await canLauncH(course.fields!.courseUrl)) {
    //                     await launch(course.fileds!.courseUrl);
    //                   } else {
    //                     print('Could not launch the link');
    //                   }
    //                 },
    //                 child: Container(
    //                   width: 200,
    //                   height: 200,
    //                   color: Colors.grey,
    //                   padding: EdgeInsets.all(8),
    //                   child: Image.network(
    //                     course.fields!.thumbnail!,
    //                     width: double.infinity,
    //                     height: double.infinity,
    //                     fit: BoxFit.cover,
    //                     ),
    //                 ),
    //               ),
    //             );
    //           };
    //       };
    //     },
    //   )
    // );
                    //child: return ListTitle(  
                    //final course = courses![index];
                    //return ListTile(
                    //    leading: CircleAvatar(
                    //        backgroundImage:
                    //            NetworkImage(course.fields!.thumbnail!)),
                    //    title: Text(course.fields!.courseName!));