// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Car> welcomeFromJson(String str) =>
    List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String welcomeToJson(List<Car> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
  Car({
    this.id,
    this.color,
    this.plateNumber,
    this.deletedAt,
    this.brandModel,
  });

  String? id;
  String? color;
  String? plateNumber;
  dynamic deletedAt;
  BrandModel? brandModel;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        color: json["color"],
        plateNumber: json["plate_number"],
        deletedAt: json["deleted_at"],
        brandModel: BrandModel.fromJson(json["brand_model"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "plate_number": plateNumber,
        "deleted_at": deletedAt,
        "brand_model": brandModel!.toJson(),
      };
}

class BrandModel {
  BrandModel({
    this.id,
    this.name,
    this.brand,
  });

  String? id;
  String? name;
  Brand? brand;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json["id"],
        name: json["name"],
        brand: Brand.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand!.toJson(),
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
