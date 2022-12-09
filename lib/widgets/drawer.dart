import 'package:start_in_mobile/pages/courses/courses.dart';
import 'package:start_in_mobile/pages/projects/projects.dart';
import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/inforum/inforum.dart';
import 'package:start_in_mobile/pages/shop/shop.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: Row(
              children: const [Text('inforum')],
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
          ListTile(
<<<<<<< HEAD
            title: const Text('Courses'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Courses()),
=======
            title: const Text('StartIn Store'),
            onTap: () {
              // Route menu ke halaman Shop
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()),
>>>>>>> 806594a34ab00cbdf516e3971cf125474434aab7
              );
            },
          ),
        ],
      ),
    );
  }
}
