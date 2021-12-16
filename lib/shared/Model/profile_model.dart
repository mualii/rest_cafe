// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Profile welcomeFromJson(String str) => Profile.fromJson(json.decode(str));

String welcomeToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String? message;
  Data? data;
  Profile({
    this.message,
    this.data,
  });



  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.user,
    this.accessToken,
  });

  User? user;
  String? accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "access_token": accessToken,
  };
}

class User {
  User({
    this.name,
    this.phone,
    this.role,
  });

  dynamic name;
  String ?phone;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    phone: json["phone"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "role": role,
  };
}
