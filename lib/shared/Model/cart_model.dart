// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Cart> welcomeFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String welcomeToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    this.id,
    this.quantity,
    this.extras,
    this.name,
    this.image,
    this.price,
    this.total,
  });

  String? id;
  int ?quantity;
  List<Extra> ?extras;
  String? name;
  String ?image;
  int? price;
  int ?total;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    quantity: json["quantity"],
    extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
    name: json["name"],
    image: json["image"],
    price: json["price"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
    "name": name,
    "image": image,
    "price": price,
    "total": total,
  };
}

class Extra {
  Extra({
    this.id,
    this.price,
    this.name,
  });

  String ?id;
  int ?price;
  String? name;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    id: json["id"],
    price: json["price"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "name": name,
  };
}
