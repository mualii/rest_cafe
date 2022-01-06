// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CarBrand CarBrandFromJson(String str) => CarBrand.fromJson(json.decode(str));

String welcomeToJson(CarBrand data) => json.encode(data.toJson());

class CarBrand {
  CarBrand({
    this.message,
    this.data,
    this.error,
  });

  String ?message;
  List<Datum>? data;
  dynamic error;

  factory CarBrand.fromJson(Map<String, dynamic> json) => CarBrand(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "error": error,
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.logo
  });

  String? id;
  String ?name;
  String ? logo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    logo:json["logo"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo":logo
  };
}
