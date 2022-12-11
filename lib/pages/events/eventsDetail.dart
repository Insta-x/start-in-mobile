import 'package:flutter/cupertino.dart';
import 'package:start_in_mobile/models/events.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';

class EventsDetail extends StatelessWidget {
  final Events data;
  const EventsDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events Detail'),
        backgroundColor: Color.fromARGB(255, 69, 39, 77),
      ),
      drawer: AppDrawer(),
      body: Container(
        margin: new EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            // JUDUL
            Center(
              child: Text(data.fields.event_title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            Row(
              children: [
                Text(
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                )
              ],
            ),
            // DESCRIPTION
            Row(
              children: [
                Text(
                  "Description : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  data.fields.description,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                )
              ],
            ),
            // Schedule
            Row(
              children: [
                Text(
                  "Schedule : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  data.fields.schedule,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                )
              ],
            ),
            // Location
            Row(
              children: [
                Text(
                  "Location : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  data.fields.location,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 69, 39, 77),
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
