// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Location welcomeFromJson(String str) => Location.fromJson(json.decode(str));

String welcomeToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    this.lat,
    this.lng,
    this.route,
    this.area,
    this.district,
    this.state,
    this.country,
  });

  String ?lat;
  String  ? lng;
  String? route;
  String ?area;
  String ?district;
  String ?state;
  String ?country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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
