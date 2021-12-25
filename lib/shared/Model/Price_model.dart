// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TotalPrice TotalPriceFromJson(String str) => TotalPrice.fromJson(json.decode(str));

String welcomeToJson(TotalPrice data) => json.encode(data.toJson());

class TotalPrice {
  TotalPrice({
    this.status,
    this.subtotal,
    this.serviceCharge,
    this.vat,
    this.total,
  });

  String ? status;
  int ?subtotal;
  int ?serviceCharge;
  int ?vat;
  int ?total;

  factory TotalPrice.fromJson(Map<String, dynamic> json) => TotalPrice(
    status: json["status"],
    subtotal: json["subtotal"],
    serviceCharge: json["service_charge"],
    vat: json["vat"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "subtotal": subtotal,
    "service_charge": serviceCharge,
    "vat": vat,
    "total": total,
  };
}
