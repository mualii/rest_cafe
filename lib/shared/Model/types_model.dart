

import 'dart:convert';

List<Types> welcomeFromJson(String str) => List<Types>.from(json.decode(str).map((x) => Types.fromJson(x)));

String welcomeToJson(List<Types> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Types {
  Types({
    this.icon,
    this.name,
    this.key
  });

  String ?icon;
  String ?name;
  String ?key;

  factory Types.fromJson(Map<String, dynamic> json) => Types(
    icon: json["icon"],
    name: json["name"],
    key:json["key"]
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "name": name,
    "key":key
  };
}
