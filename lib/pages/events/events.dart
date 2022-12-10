import 'package:flutter/material.dart';
import 'package:start_in_mobile/widgets/drawer.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
        backgroundColor: Color.fromARGB(255, 69, 39, 77),

      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                // Image.asset('assets/image1.jpg'),
                Text('Card 1 - Talkshow'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                // Image.asset('assets/image2.jpg'),
                Text('Card 2 - Workshop'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                // Image.asset('assets/image3.jpg'),
                Text('Card 3 - Talkshow'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
