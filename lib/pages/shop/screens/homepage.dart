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
          backgroundColor: Color.fromARGB(255, 209, 223, 12),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 7),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 51, 204, 255), width: 1),
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                ),
                child: Text(
                  "In order to keep running and maintaining StartIn, we need an additional funds. StartIn Store was built because we want to keep developing our website so we can help more and more inovators arount the world!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              )),
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
        ));
  }
}
