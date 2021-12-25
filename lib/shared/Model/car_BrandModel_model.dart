// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CarModel carModelFromJson(String str) => CarModel.fromJson(json.decode(str));

String welcomeToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  CarModel({
    this.message,
    this.data,
    this.error,
  });

  String? message;
  List<Modles>? data;
  dynamic error;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    message: json["message"],
    data: List<Modles>.from(json["data"].map((x) => Modles.fromJson(x))),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "error": error,
  };
}

class Modles {
  Modles({
    this.id,
    this.name,
  });

  String ?id;
  String ?name;

  factory Modles.fromJson(Map<String, dynamic> json) => Modles(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
