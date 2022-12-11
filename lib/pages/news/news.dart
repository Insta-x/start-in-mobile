import 'package:flutter/material.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/queries/get_all_news.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  // List<String> news = [];
  // @override
  // void initState() {
  //   super.initState();
  //   get_all_news().then((data) => {
  //     setState(() {
  //     })
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News")
        ,
      ),
      drawer: const AppDrawer(),
       body: FutureBuilder(
        future: get_all_news(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada berita :(",
                    style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black, blurRadius: 2.0)
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      // Judul Berita
                      Text(
                        "${snapshot.data![index].title}",
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
                      Text(
                        "${snapshot.data![index].description}",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
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
                      // Url
                      Text(
                        "Source: ${snapshot.data![index].url}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //   backgroundColor: Color.fromARGB(255, 69, 39, 77),
                      //   minimumSize: const Size.fromHeight(40),
                      //   ),
                      //   onPressed: () {
                      //   Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => EventsDetail(data: snapshot.data![index]))
                      //     );
                      //   },
                      //   child: const Text(
                      //     'Read more',
                      //     style: TextStyle(fontSize: 12),
                      //   ),
                      // ),
                    ],
                  ),
                )
              );
            }
          }
        }
      )
    );
  }
}