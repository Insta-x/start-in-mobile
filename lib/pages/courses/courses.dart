import 'package:flutter/material.dart';
import 'package:start_in_mobile/widgets/drawer.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {

  // @override
  // void initState() {
  //   Future<List<WatchList>> fetchWatchList() async {
  //     var url =
  //         Uri.parse('https://start-in.up.railway.app/courses/json');
  //     var response = await http.get(
  //       url,
  //     );
  //     var data = jsonDecode(utf8.decode(response.bodyBytes));
  //     print(data);

  //     List<WatchList> listToDo = [];
  //     for (var d in data) {
  //       if (d != null) {
  //         listToDo.add(WatchList.fromJson(d));
  //       }
  //     }

  //     return listToDo;
  //   }

  //   super.initState();
  //   _remoteDataSource = WatchListRemoteDataSource();
  //   print(_remoteDataSource);
  //   _futureWatchList = _remoteDataSource.fetchWatchList();
  // }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "courses",
          style: TextStyle(color: Color.fromARGB(255, 0, 32, 92))
        ),
        backgroundColor:  Color.fromARGB(255,146, 232, 176),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children:  [
              Container(width: double.infinity,
              height: 200.0,
              decoration:
                const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/inforum-banner.jpg"),
                    fit: BoxFit.cover
                )),
              child: const Center(
                child: Text(
                  "aduh,satu,dua,tiga",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0)),
                  ),)
              Container(width: double.infinity,
              height: 200.0,
              decoration:
                const 
              )
            ]   
          ),
        ),
      ));
  }
}

