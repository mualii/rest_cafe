// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Details welcomeFromJson(String str) => Details.fromJson(json.decode(str));

String welcomeToJson(Details data) => json.encode(data.toJson());

class Details {
  Details({
    this.id,
    this.preparationTime,
    this.canReserveTable,
    this.canDeliverToCar,
    this.canPickupOrder,
    this.totalRating,
    this.isOpen,
    this.type,
    this.logo,
    this.name,
    this.cuisine,
    this.categories,
  });

  String? id;
  int ?preparationTime;
  bool ?canReserveTable;
  bool ?canDeliverToCar;
  bool ?canPickupOrder;
  String ?totalRating;
  bool? isOpen;
  String? type;
  String ?logo;
  String ?name;
  String ?cuisine;
  List<Category> ?categories;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    preparationTime: json["preparation_time"],
    canReserveTable: json["can_reserve_table"],
    canDeliverToCar: json["can_deliver_to_car"],
    canPickupOrder: json["can_pickup_order"],
    totalRating: json["total_rating"],
    isOpen: json["is_open"],
    type: json["type"],
    logo: json["logo"],
    name: json["name"],
    cuisine: json["cuisine"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "preparation_time": preparationTime,
    "can_reserve_table": canReserveTable,
    "can_deliver_to_car": canDeliverToCar,
    "can_pickup_order": canPickupOrder,
    "total_rating": totalRating,
    "is_open": isOpen,
    "type": type,
    "logo": logo,
    "name": name,
    "cuisine": cuisine,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.items,
  });

  String ?id;
  String? name;
  List<Item> ?items;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.image,
    this.price,
    this.name,
  });

  String? id;
  String ?image;
  int? price;
  String? name;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    image: json["image"],
    price: json["price"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "price": price,
    "name": name,
  };
}
