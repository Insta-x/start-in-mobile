import 'package:start_in_mobile/pages/projects/projects.dart';
import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/inforum/inforum.dart';


class AppDrawer extends StatefulWidget {

  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}


class _AppDrawerState extends State<AppDrawer> {

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: Row(
              children: const [
                Text('inforum')
              ],
            ),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InForum()),
              );
            },
          ),
          ListTile(
            title: const Text('StartIn'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProjectsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}