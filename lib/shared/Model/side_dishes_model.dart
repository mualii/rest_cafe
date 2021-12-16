// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SideDish welcomeFromJson(String str) => SideDish.fromJson(json.decode(str));

String welcomeToJson(SideDish data) => json.encode(data.toJson());

class SideDish {
  SideDish({
    this.id,
    this.image,
    this.price,
    this.name,
    this.description,
    this.extras,
  });

  String? id;
  String ?image;
  int ?price;
  String? name;
  String ?description;
  List<Extra>? extras;

  factory SideDish.fromJson(Map<String, dynamic> json) => SideDish(
    id: json["id"],
    image: json["image"],
    price: json["price"],
    name: json["name"],
    description: json["description"],
    extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "price": price,
    "name": name,
    "description": description,
    "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
  };
}

class Extra {
  Extra({
    this.id,
    this.price,
    this.name,
  });

  String? id;
  int ?price;
  String? name;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    id: json["id"],
    price: json["price"] == null ? null : json["price"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price == null ? null : price,
    "name": name,
  };
}
