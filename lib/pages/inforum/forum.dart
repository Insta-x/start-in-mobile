import 'package:flutter/material.dart';
import 'package:start_in_mobile/models/Forum.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/queries/get_all_comment.dart';

class ForumPage extends StatefulWidget {
  Forum data;

  ForumPage({super.key, required this.data});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "inforum",
          style: TextStyle(color: Color.fromARGB(255, 0, 32, 92)),
        )),
        drawer: const AppDrawer(),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.fields.title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text("${widget.data.fields.timeCreated}",
                            style: const TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 42, 41, 41))),
                        const Text(" - "),
                        Text(widget.data.fields.username,
                            style: const TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 42, 41, 41))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(widget.data.fields.content,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black))
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: const Text("comments",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(248, 26, 27, 32),
                        fontWeight: FontWeight.bold,
                      ))),
              Expanded(
                child: FutureBuilder(
                    future: get_all_comment(widget.data.pk),
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
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 10),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.5, color: Colors.grey)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${snapshot.data![index].fields.username}",
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Color.fromARGB(
                                                    255, 42, 41, 41),
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Text(
                                                "${snapshot.data![index].fields.timeCreated}",
                                                style: const TextStyle(
                                                    fontSize: 12.0,
                                                    color: Color.fromARGB(
                                                        255, 42, 41, 41))),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                            "${snapshot.data![index].fields.comment}",
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black))
                                      ],
                                    ),
                                  )));
                        }
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
