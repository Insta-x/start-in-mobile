import 'package:flutter/material.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/queries/get_all_news.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<String> news = [];
  @override
  void initState() {
    super.initState();
    get_all_news().then((data) => {
      setState(() {
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        backgroundColor: Color.fromARGB(255, 44, 83, 95),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                // Image.asset('assets/image1.jpg'),
                Text('Card 1'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                // Image.asset('assets/image2.jpg'),
                Text('Card 2'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                // Image.asset('assets/image3.jpg'),
                Text('Card 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MyCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: <Widget>[
//           Image.asset('assets/image.jpg'),
//           Text('Card Title'),
//           Text('Card Subtitle'),
//         ],
//       ),
//     );
//   }
// }