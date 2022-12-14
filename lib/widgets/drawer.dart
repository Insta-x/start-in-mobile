import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:start_in_mobile/pages/home.dart';
import 'package:start_in_mobile/pages/projects/projects_home.dart';
import 'package:start_in_mobile/pages/inforum/inforum.dart';
import 'package:start_in_mobile/pages/shop/shop.dart';
import 'package:start_in_mobile/pages/news/news.dart';
import 'package:start_in_mobile/pages/events/events.dart';
import 'package:start_in_mobile/pages/courses/courses.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';
import 'package:start_in_mobile/queries/authentication/auth_logout.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: Row(
                children: const [Text('Home')],
              ),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectsPage()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: const [Text('Forum')],
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
              title: const Text('Events'),
              onTap: () {
                // Route menu ke halaman events
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Events()),
                );
              },
            ),
            ListTile(
              title: const Text('Courses'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Courses()),
                );
              },
            ),
            ListTile(
              title: const Text('News'),
              onTap: () {
                // Route menu ke halaman News
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => News()),
                );
              },
            ),
            ListTile(
              title: const Text('Shop'),
              onTap: () {
                // Route menu ke halaman Shop
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPage()),
                );
              },
            ),
            ListTile(
              title: Text(request.loggedIn ? 'Logout' : 'Login'),
              onTap: () {
                // Route menu ke halaman Shop
                if (request.loggedIn) {
                  logout(request);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
