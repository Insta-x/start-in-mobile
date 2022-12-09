import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/shop/screens/homepage.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop",
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
