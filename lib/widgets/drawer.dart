import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/pages/projects/projects.dart';
import 'package:start_in_mobile/pages/inforum/inforum.dart';
import 'package:start_in_mobile/pages/shop/shop.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';

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
            title: const Text('StartIn Store'),
            onTap: () {
              // Route menu ke halaman Shop
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()),
              );
            },
          ),
          ListTile(
            title: Text(
                context.read<CookieRequest>().loggedIn ? 'Logout' : 'Login'),
            onTap: () {
              // Route menu ke halaman Shop
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
