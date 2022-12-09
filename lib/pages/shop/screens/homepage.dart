import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/shop/widgets/all_products.dart';
import '../widgets/category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("StartIn Shop"),
      ),
      body: ListView(
        children: <Widget>[
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
          SizedBox(height: 100, width: 100, child: ProductsPage())
        ],
      ),
    );
  }
}
