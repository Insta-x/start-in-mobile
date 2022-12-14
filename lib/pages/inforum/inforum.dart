import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/inforum/forum.dart';
import 'package:start_in_mobile/pages/inforum/widgets/forumForm.dart';
import 'package:start_in_mobile/pages/inforum/widgets/forumModal.dart';
import 'package:start_in_mobile/queries/inforum/get_all_forum.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:start_in_mobile/widgets/bottomModal.dart';

class InForum extends StatefulWidget {
  const InForum({super.key});

  @override
  _InForumState createState() => _InForumState();
}

class _InForumState extends State<InForum> {

  dynamic pallete = {
    'technology' : Colors.blue,
    'business' : Colors.amber,
    'startup' : Colors.lightGreen,
    'misc' : Colors.grey,
  } ;

  @override
  Widget build(BuildContext context) {

    var request = context.watch<CookieRequest>();
    
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "inforum",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 42, 170, 26),
        ),
        drawer: const AppDrawer(),
        floatingActionButton:  FloatingActionButton(

          onPressed: request.loggedIn ? (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ForumForm())
            );
          }: null,
          backgroundColor: request.loggedIn ?  const Color.fromARGB(255, 44, 145, 195) : Color.fromARGB(255, 189, 188, 188),
          child: Icon(
              Icons.add_comment,
              color : request.loggedIn  ? Colors.white : Color.fromARGB(255, 88, 88, 88),
              size :27.0
              ),
        ),
        body: FutureBuilder(
                    future: get_all_forum(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Tidak ada forum :(",
                                style: TextStyle(
                                    color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                              
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ForumPage(
                                                data: snapshot.data![index])));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1.0,
                                          color: pallete[snapshot
                                                  .data![index].fields.category],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 0.5)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.data![index].fields.title}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Text("${snapshot.data![index].fields.timeCreated}",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Color.fromARGB(255, 42, 41, 41)
                                            )),
                                            const Text(" - "),
                                            Text("${snapshot.data![index].fields.username}",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Color.fromARGB(255, 42, 41, 41)
                                            )),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text("${snapshot.data![index].fields.content}",
                                        style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black
                                            )
                                        
                                        )

                                      ],
                                    ),
                                  )));
                        }
                      }
                    }));
  }
}
