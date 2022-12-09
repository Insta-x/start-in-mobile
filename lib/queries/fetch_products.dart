import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/products.dart';

Future<List<Product>> fetchProducts() async {
  var response = await http.get(
    Uri.parse('https://start-in.up.railway.app/shop/json/'),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var responseData = jsonDecode(utf8.decode(response.bodyBytes));

  List<Product> products = [];

  for (var product in responseData) {
    if (product != null) {
      products.add(Product.fromJson(product['fields']));
    }
  }

  return products;
}
