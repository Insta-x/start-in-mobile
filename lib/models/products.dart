import 'dart:convert';

List<Product> todoFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String todoToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {

  late String name;
  late double price;
  late String image;
  late String category;

      Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.category});
  
  
  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //     name: json['name'],
  //     price: json['price'],
  //     // image: Image.asset(json['image']),
  //     image: json['image'],
  //     category: json['category'],
  //   );
  // }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "image": image,
        "category": category,
      };
}
