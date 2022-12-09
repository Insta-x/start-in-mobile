import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/shop/widgets/all_products.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import '../widgets/category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("StartIn Shop"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Memasukkan widgets category
          Category(),
          Center(
            child: Text(
              "Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Memasukkan widgets products
          Expanded(
            child: ProductsPage(),
          )
        ],
      ),
      )
    );
  }
}
