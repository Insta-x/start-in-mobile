import 'package:start_in_mobile/main.dart';
import 'package:start_in_mobile/projects/projects.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('StartIn'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Home Page')),
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
