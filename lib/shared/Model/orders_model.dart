// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) => List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String welcomeToJson(List<Orders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    this.id,
    this.userId,
    this.orderNumber,
    this.deliveryType,
    this.vehicleId,
    this.paymentMethod,
    this.subTotal,
    this.serviceCharge,
    this.vatPrice,
    this.discount,
    this.total,
    this.createdAt,
    this.status,
    this.itemsCount,
    this.vehicle,
    this.reservationDetails,
    this.branch,
  });

  String ?id;
  String ?userId;
  String ?orderNumber;
  String ?deliveryType;
  String ?vehicleId;
  String ?paymentMethod;
  String ?subTotal;
  String ?serviceCharge;
  String ?vatPrice;
  String ?discount;
  String ?total;
  String ?createdAt;
  String ?status;
  int ?itemsCount;
  Vehicle ?vehicle;
  ReservationDetails ?reservationDetails;
  Branch ?branch;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    id: json["id"],
    userId: json["user_id"],
    orderNumber: json["order_number"],
    deliveryType: json["delivery_type"],
    vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
    paymentMethod: json["payment_method"],
    subTotal: json["sub_total"],
    serviceCharge: json["service_charge"],
    vatPrice: json["vat_price"],
    discount: json["discount"],
    total: json["total"],
    createdAt: json["created_at"],
    status: json["status"],
    itemsCount: json["items_count"],
    vehicle: json["vehicle"] == null ? null : Vehicle.fromJson(json["vehicle"]),
    reservationDetails: json["reservation_details"] == null ? null : ReservationDetails.fromJson(json["reservation_details"]),
    branch: Branch.fromJson(json["branch"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_number": orderNumber,
    "delivery_type": deliveryType,
    "vehicle_id": vehicleId == null ? null : vehicleId,
    "payment_method": paymentMethod,
    "sub_total": subTotal,
    "service_charge": serviceCharge,
    "vat_price": vatPrice,
    "discount": discount,
    "total": total,
    "created_at": createdAt,
    "status": status,
    "items_count": itemsCount,
    "vehicle": vehicle == null ? null : vehicle!.toJson(),
    "reservation_details": reservationDetails == null ? null : reservationDetails!.toJson(),
    "branch": branch!.toJson(),
  };
}

class Branch {
  Branch({
    this.id,
    this.preparationTime,

    this.isOpen,
    this.type,
    this.logo,
    this.name,
    this.cuisine,

  });

  String ?id;
  int ?preparationTime;
  bool ?canReserveTable;
  bool ?canDeliverToCar;
  bool ?canPickupOrder;
  bool ?isOpen;
  String ?type;
  String ?logo;
  String ?name;
  String ?cuisine;
  double ?lat;
  double ?lng;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    preparationTime: json["preparation_time"],

    isOpen: json["is_open"],
    type: json["type"],
    logo: json["logo"],
    name: json["name"],
    cuisine: json["cuisine"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,

    "is_open": isOpen,
    "type": type,
    "logo": logo,
    "name": name,
    "cuisine": cuisine,

  };
}

class ReservationDetails {
  ReservationDetails({
    this.id,
    this.persons,
    this.date,
    this.time,
  });

  String ?id;
  int ?persons;
  DateTime ?date;
  String ?time;

  factory ReservationDetails.fromJson(Map<String, dynamic> json) => ReservationDetails(
    id: json["id"],
    persons: json["persons"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "persons": persons,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
  };
}

class Vehicle {
  Vehicle({
    this.id,
    this.color,
    this.plateNumber,
    this.brandModel,
  });

  String ?id;
  String ?color;
  String ?plateNumber;
  BrandModel ?brandModel;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    color: json["color"],
    plateNumber: json["plate_number"],
    brandModel: BrandModel.fromJson(json["brand_model"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "color": color,
    "plate_number": plateNumber,
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
  Brand ?brand;

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

  String ?id;
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
