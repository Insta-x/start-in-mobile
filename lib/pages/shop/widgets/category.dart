import 'package:flutter/material.dart';
import 'category_card.dart';

class Category extends StatelessWidget {

  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView(
        scrollDirection: Axis.vertical,
        children:  <Widget>[
          CategoryCard(
              const Icon(
                Icons.discount,
                size: 40,
              ),
              'Clothing'),
          CategoryCard(
              const Icon(
                Icons.watch,
                size: 40,
              ),
              'Accessories'),
        ],
      ),
    );
  }
}
