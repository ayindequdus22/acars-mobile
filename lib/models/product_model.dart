import 'dart:convert';
List<ProductModel> productFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  final String id;
  final String name;
  final String image;
  final num price; 

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "image": image,
      };
}

















// @immutable
// class ProductModel {
//   final String id;
//   final String name;
//   final String image;
//   final int price;

//   const ProductModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.price,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json['_id'] as String,
//         name: json['name'] as String,
//         image: json['image'] as String,
//         price: json['price'] as int,
//       );
// }
