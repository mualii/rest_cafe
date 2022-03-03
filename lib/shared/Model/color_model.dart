// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Colors> colorsFromJson(String str) => List<Colors>.from(json.decode(str).map((x) => Colors.fromJson(x)));

String welcomeToJson(List<Colors> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Colors {
  Colors({
    this.id,
    this.name,
    this.hex

  });

  int ?id;
  String ? hex;
  String? name;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    id: json["id"],
    name: json["name"],
    hex: json["hex"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
