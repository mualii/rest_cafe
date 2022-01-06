// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<FavoruiteResturant> FavoruiteResturantFromJson(String str) => List<FavoruiteResturant>.from(json.decode(str).map((x) => FavoruiteResturant.fromJson(x)));

String welcomeToJson(List<FavoruiteResturant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoruiteResturant {
  FavoruiteResturant({
    this.id,
    this.branchId,
    this.branch,
  });

  String ?id;
  String ?branchId;
  Branch ?branch;

  factory FavoruiteResturant.fromJson(Map<String, dynamic> json) => FavoruiteResturant(
    id: json["id"],
    branchId: json["branch_id"],
    branch: Branch.fromJson(json["branch"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch_id": branchId,
    "branch": branch!.toJson(),
  };
}

class Branch {
  Branch({
    this.id,
    this.restaurantId,
    this.preparationTime,
    this.canReserveTable,
    this.canDeliverToCar,
    this.canPickupOrder,
    this.isOpen,
    this.type,
    this.logo,
    this.name,
    this.cuisine,
    this.lat,
    this.lng,
    this.isFavourite,
    this.isOpenNow,
  });

  String ?id;
  String ?restaurantId;
  int ?preparationTime;
  bool ?canReserveTable;
  bool ?canDeliverToCar;
  bool ?canPickupOrder;
  bool ?isOpen;
  String ?type;
  String ?logo;
  String ?name;
  String ?cuisine;
  double ?lat;
  double ?lng;
  bool ?isFavourite;
  bool ?isOpenNow;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    restaurantId: json["restaurant_id"],
    preparationTime: json["preparation_time"],
    canReserveTable: json["can_reserve_table"],
    canDeliverToCar: json["can_deliver_to_car"],
    canPickupOrder: json["can_pickup_order"],
    isOpen: json["is_open"],
    type: json["type"],
    logo: json["logo"],
    name: json["name"],
    cuisine: json["cuisine"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
    isFavourite: json["IsFavourite"],
    isOpenNow: json["IsOpenNow"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "restaurant_id": restaurantId,
    "preparation_time": preparationTime,
    "can_reserve_table": canReserveTable,
    "can_deliver_to_car": canDeliverToCar,
    "can_pickup_order": canPickupOrder,
    "is_open": isOpen,
    "type": type,
    "logo": logo,
    "name": name,
    "cuisine": cuisine,
    "lat": lat,
    "lng": lng,
    "IsFavourite": isFavourite,
    "IsOpenNow": isOpenNow,
  };
}
