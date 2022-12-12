// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/courses_data.dart';
import '../../queries/fetch_courses.dart';

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
        //backgroundColor: Colors.transparent,
        backgroundColor: Colors.blueAccent,
        extendBodyBehindAppBar: true,
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
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
                            "There is no Courses",
                            style:
                                TextStyle(color: Color(0x000000), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      print("masuk ke listview");
                      return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () async {
                                final course = courses[index];
                                String? url = course.fields!.courseUrl; //belum setting url onTap
                              },  child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(0, 1, 1, 1),
                                    borderRadius:BorderRadius.all(Radius.circular(20)),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(0, 0, 0, 0),
                                            width: 0.5)),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 5),
                                            Text("testing1",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    courses![index].fields!.courseName!,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Row()
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                        )
                                      ]
                                    )
                                  )
                                )
                              );
                            }
                          }
                        }
                      )
                    )
                  );
                }
              }

                              
                      
        

  
                
                          
                      



//         margin: const EdgeInsets.all(0),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//                 Color.fromARGB(255, 152, 238, 255),
//               ]),
//         ),
//         child: Scaffold(
//             body: FutureBuilder<List<AddedCourse>>(
//                 future: CourseApi.getCourse(),
//                 builder: (context, snapshot) {
//                   final courses = snapshot.data;
//                 }
//             )
//         )
//     );
//   }
// }




                  // switch (snapshot.connectionState) {
                  //   case ConnectionState.waiting:
                  //     return Center(child: CircularProgressIndicator());
                  //   default:
                  //     if (snapshot.hasError) {
                  //       return Center(child: Text('Error Occured!'));
                  //     } else {}
                  //     return ListView.build(
                  //         physics: const AlwaysScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: courses?.length,
                  //         itemBuilder: (context, index) =>
                  //             GestureDetector(onTap: () async {
                  //               final course = courses![index];
                  //               String? url = course.fields!.courseUrl;

















//     return Container(
//         margin: const EdgeInsets.all(0),
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [Color.fromARGB(244, 172, 101, 255),BaseColors.green,]),));
//   }
// }


        
//     return Scaffold(
//         body: FutureBuilder<List<AddedCourse>>(
//             future: CoursesApi.getCourse(),
//             builder: (context, snapshot) {
//               final courses = snapshot.data;

//               switch (snapshot.connectionState) {
//                 case ConnectionState.waiting:
//                   return Center(child: CircularProgressIndicator());
//                 default:
//                   if (snapshot.hasError) {
//                     return Center(child: Text('Error Occurred!'));
//                   } else {
//                     return ListView.builder(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: courses?.length,
//                       itemBuilder: (context, index) => GestureDetector(
//                         onTap: () async {
//                           final course = courses![index];
//                           String? url = course.fields!.courseUrl;
//                           if (await canLaunch(url)) {
//                             await launch(url);
//                           } else {
//                             throw 'Link error';
//                           }
//                         },
//                       ),
//                     );
//                   }
//               }
//               ;
//             }));
//   }
// }
            
                  
   
//                     //itemBuilder: (context, index) => GestureDetector());
                




//     //             return .builder(
//     //               physics: BouncingScrollPhysics(),
//     //               itemCount: courses?.length,
//     //               final course = courses![index];
                  
//     //               itemBuilder: (context, index) => GestureDetector(
//     //                 onTap: () async {
//     //                   if (await canLauncH(course.fields!.courseUrl)) {
//     //                     await launch(course.fileds!.courseUrl);
//     //                   } else {
//     //                     print('Could not launch the link');
//     //                   }
//     //                 },
//     //                 child: Container(
//     //                   width: 200,
//     //                   height: 200,
//     //                   color: Colors.grey,
//     //                   padding: EdgeInsets.all(8),
//     //                   child: Image.network(
//     //                     course.fields!.thumbnail!,
//     //                     width: double.infinity,
//     //                     height: double.infinity,
//     //                     fit: BoxFit.cover,
//     //                     ),
//     //                 ),
//     //               ),
//     //             );
//     //           };
//     //       };
//     //     },
//     //   )
//     // );
//                     //child: return ListTitle(  
//                     //final course = courses![index];
//                     //return ListTile(
//                     //    leading: CircleAvatar(
//                     //        backgroundImage:
//                     //            NetworkImage(course.fields!.thumbnail!)),
//                     //    title: Text(course.fields!.courseName!));