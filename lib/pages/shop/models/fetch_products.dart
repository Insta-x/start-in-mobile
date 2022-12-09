import 'package:http/http.dart' as http;
import 'dart:convert';
import './products.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('https://start-in.up.railway.app/shop/json/'),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*'
    },
  );

  var responseData = jsonDecode(response.body);

  List<Product> products = [];

  for (var product in responseData) {
    if (product != null) {
      products.add(Product.fromJson(product['fields']));
    }
  }

  return products;
}
