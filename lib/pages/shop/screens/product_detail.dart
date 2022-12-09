import 'package:start_in_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const AppDrawer(),
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
