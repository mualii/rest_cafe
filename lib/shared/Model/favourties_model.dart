// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Favourites> welcomeFromJson(String str) => List<Favourites>.from(json.decode(str).map((x) => Favourites.fromJson(x)));

String welcomeToJson(List<Favourites> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favourites {
  Favourites({
    this.id,
    this.userId,
    this.itemId,
    this.createdAt,
    this.updatedAt,
    this.item,
  });

  String ? id;
  String ?userId;
  String ?itemId;
  DateTime ?createdAt;
  DateTime ?updatedAt;
  Item ?item;

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
    id: json["id"],
    userId: json["user_id"],
    itemId: json["item_id"],

    item: Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "item_id": itemId,

    "item": item!.toJson(),
  };
}

class Item {
  Item({
    this.id,
    this.branchId,
    this.image,
    this.price,
    this.name,
    this.isFavourite,
  });

  String ?id;
  String ?branchId;
  String ?image;
  int ?price;
  String ?name;
  bool ?isFavourite;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    branchId: json["branch_id"],
    image: json["image"],
    price: json["price"],
    name: json["name"],
    isFavourite: json["IsFavourite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch_id": branchId,
    "image": image,
    "price": price,
    "name": name,
    "IsFavourite": isFavourite,
  };
}
