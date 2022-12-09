import '../models/fetch_products.dart';
import '../models/products.dart';
import 'package:start_in_mobile/widgets/drawer.dart';
import '../screens/product_detail.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Product'),
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Text(
                "Tidak ada Watchlist",
              );
            } else {
              return SizedBox(
                  width: 200,
                  height: 200,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Card(
                            child: InkWell(
                              child: Container(
                                width: 100,
                                height: 100,
                                padding: const EdgeInsets.all(11.0),
                                child: Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => ProductDetail(
                              //         product: snapshot.data![index],
                              //       ),
                              //     ),
                              //   );
                              // },
                            ),
                          )));
            }
          }
        },
      ),
    );
  }
}
