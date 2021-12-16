// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Car> welcomeFromJson(String str) => List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String welcomeToJson(List<Car> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
  Car({
    this.id,
    this.brand,
    this.color,
    this.plateNumber,
  });

  String? id;
  String ?brand;
  String? color;
  String? plateNumber;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    id: json["id"],
    brand: json["brand"],
    color: json["color"],
    plateNumber: json["plate_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "color": color,
    "plate_number": plateNumber,
  };
}
