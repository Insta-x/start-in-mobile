import 'package:flutter/material.dart';
import 'category_card.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CategoryCard(
              Icon(
                Icons.discount,
                size: 40,
              ),
              'Clothing'),
          CategoryCard(
              Icon(
                Icons.watch,
                size: 40,
              ),
              'Accessories'),
        ],
      ),
    );
  }
}
