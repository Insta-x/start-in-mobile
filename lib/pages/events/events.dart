import 'package:flutter/material.dart';
import 'package:start_in_mobile/queries/get_all_events.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:start_in_mobile/pages/events/eventsDetail.dart';

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
      body: FutureBuilder(
        future: get_all_events(),
        builder: (context, AsyncSnapshot snapshot) {
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
                      // Tipe event --> Talkshow/Workshop
                      Text(
                        "${snapshot.data![index].fields.event_type}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // Judul Event
                      Text(
                        "${snapshot.data![index].fields.event_title}",
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
                        "${snapshot.data![index].fields.schedule}",
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // Jarak line spacing
                      Text(
                        "",
                        style: const TextStyle(
                          fontSize: 3.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Lokasi event
                      Text(
                        "${snapshot.data![index].fields.location}",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Jarak line spacing
                      Text(
                        "",
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 69, 39, 77),
                        minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventsDetail(data: snapshot.data![index]))
                          );
                        },
                        child: const Text(
                          'Read more',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
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
