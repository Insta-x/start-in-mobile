import 'dart:html';

import 'package:flutter/material.dart';
import 'package:start_in_mobile/drawer.dart';

class InForum extends StatefulWidget {
  const InForum({super.key});

  @override
  _InForumState createState() => _InForumState();
}

class _InForumState extends State<InForum> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "inforum",
            style: TextStyle(color: Color.fromARGB(255, 0, 32, 92)),
          ),
          backgroundColor: Color.fromARGB(255, 146, 232, 176),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children:  [
                Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration:
                         const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/inforum-banner.jpg"),
                              fit : BoxFit.cover
                          )),
                    child: const Center(
                      child: Text(
                        "inspirational,  insightful,  innovative",
                        style: TextStyle(
                          color : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0)),
                    ),)
                    
              ],
            ),
          ),
        ));
  }
}
