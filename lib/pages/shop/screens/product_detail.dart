import 'package:start_in_mobile/pages/shop/widgets/category.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/shop/screens/checkout.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:start_in_mobile/pages/authentication/login.dart';

class ProductDetail extends StatelessWidget {
  final product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                // Menggunakan image dari web karena tidak tahu fetch image dari json
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                      "https://media.istockphoto.com/id/491520707/photo/sample-red-grunge-round-stamp-on-white-background.jpg?s=612x612&w=0&k=20&c=FW80kR5ilPkiJtXZEauGTghNBOgQviVPxAbhLWwnKZk="),
                ),
              ),
              Container(
                child: Text.rich(
                  TextSpan(
                      text: "Rp${product.price.toString()}",
                      style: const TextStyle(
                        fontSize: 35,
                      )),
                ),
              ),
              Container(
                child: Text.rich(
                  TextSpan(
                      text: "${product.description.toString()}",
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Route menuju halaman checkout jika user login
          if (request.loggedIn) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => Checkout(
                          item: product,
                        ))));
          } else {
            // Redirect ke login page
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => LoginPage())));
          }
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.fromLTRB(7, 7, 7, 15),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
