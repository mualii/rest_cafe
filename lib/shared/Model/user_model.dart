// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ClientUser welcomeFromJson(String str) => ClientUser.fromJson(json.decode(str));

String welcomeToJson(ClientUser data) => json.encode(data.toJson());

class ClientUser {
  ClientUser({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  String? id;
  String? name;
  String? email;
  String? phone;

  factory ClientUser.fromJson(Map<String, dynamic> json) => ClientUser(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}
