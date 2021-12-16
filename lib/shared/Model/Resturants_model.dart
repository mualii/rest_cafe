// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Resturants welcomeFromJson(String str) => Resturants.fromJson(json.decode(str));

String welcomeToJson(Resturants data) => json.encode(data.toJson());

class Resturants {
  Resturants({
    this.address,
    this.totalResults,
    this.data,
  });

  Address? address;
  int ?totalResults;
  List<Datum> ?data;

  factory Resturants.fromJson(Map<String, dynamic> json) => Resturants(
    address: Address.fromJson(json["address"]),
    totalResults: json["total_results"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "address": address!.toJson(),
    "total_results": totalResults,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.lat,
    this.lng,
    this.route,
    this.area,
    this.district,
    this.state,
    this.country,
  });

  String ?lat;
  String ?lng;
  String? route;
  String? area;
  String ?district;
  String ?state;
  String ?country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    lat: json["lat"],
    lng: json["lng"],
    route: json["route"],
    area: json["area"],
    district: json["district"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
    "route": route,
    "area": area,
    "district": district,
    "state": state,
    "country": country,
  };
}

class Datum {
  Datum({
    this.id,
this.lat,
    this.lng,
    this.preparationTime,
    this.canReserveTable,
    this.canDeliverToCar,
    this.canPickupOrder,
    this.isOpen,
    this.distance,
    this.logo,
    this.name,
    this.cuisine,
    this.type
  });
double ?lat,lng;
  String ?id;
  int ?preparationTime;
  bool ?canReserveTable;
  bool ?canDeliverToCar;
  bool ?canPickupOrder;
  bool ?isOpen;
  double? distance;
  String ?logo;
  String ?name;
  String ?cuisine;
  String ?type;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type:json["type"],
    lat: json["lat"],
    lng:json["lng"],
    preparationTime: json["preparation_time"],
    canReserveTable: json["can_reserve_table"],
    canDeliverToCar: json["can_deliver_to_car"],
    canPickupOrder: json["can_pickup_order"],
    isOpen: json["is_open"],
    distance: json["distance"].toDouble(),
    logo: json["logo"],
    name: json["name"],
    cuisine: json["cuisine"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "preparation_time": preparationTime,
    "can_reserve_table": canReserveTable,
    "can_deliver_to_car": canDeliverToCar,
    "can_pickup_order": canPickupOrder,
    "is_open": isOpen,
    "distance": distance,
    "logo": logo,
    "name": name,
    "type":type,
    "cuisine": cuisine,
  };
}
