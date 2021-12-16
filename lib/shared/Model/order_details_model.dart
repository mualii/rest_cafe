// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OrderDetails welcomeFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String welcomeToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  OrderDetails({
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
    this.branch,
    this.vehicle,
    this.reservationDetails,
    this.orderLine,
  });

  String ? id;
  String ?userId;
  String ?orderNumber;
  String ?deliveryType;
  dynamic vehicleId;
  String ?paymentMethod;
  String ?subTotal;
  String ?serviceCharge;
  String ?vatPrice;
  String ?discount;
  String ?total;
  String ?createdAt;
  String ?status;
  int ?itemsCount;
  Branch ?branch;
  dynamic vehicle;
  ReservationDetails ? reservationDetails;
  List<OrderLine> ? orderLine;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    id: json["id"],
    userId: json["user_id"],
    orderNumber: json["order_number"],
    deliveryType: json["delivery_type"],
    vehicleId: json["vehicle_id"],
    paymentMethod: json["payment_method"],
    subTotal: json["sub_total"],
    serviceCharge: json["service_charge"],
    vatPrice: json["vat_price"],
    discount: json["discount"],
    total: json["total"],
    createdAt: json["created_at"],
    status: json["status"],
    itemsCount: json["items_count"],
    branch: Branch.fromJson(json["branch"]),
    vehicle: json["vehicle"],
    reservationDetails: json["reservation_details"]!=null? ReservationDetails.fromJson(json["reservation_details"]):null,
    orderLine: List<OrderLine>.from(json["order_line"].map((x) => OrderLine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_number": orderNumber,
    "delivery_type": deliveryType,
    "vehicle_id": vehicleId,
    "payment_method": paymentMethod,
    "sub_total": subTotal,
    "service_charge": serviceCharge,
    "vat_price": vatPrice,
    "discount": discount,
    "total": total,
    "created_at": createdAt,
    "status": status,
    "items_count": itemsCount,
    "branch": branch!.toJson(),
    "vehicle": vehicle,
    "reservation_details": reservationDetails!.toJson(),
    "order_line": List<dynamic>.from(orderLine!.map((x) => x)),
  };
}

class Branch {
  Branch({
    this.id,
    this.preparationTime,
    this.canReserveTable,
    this.canDeliverToCar,
    this.canPickupOrder,
    this.isOpen,
    this.type,
    this.logo,
    this.name,
    this.cuisine,
    this.lat,
    this.lng,
  });

  String  ? id;
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
    canReserveTable: json["can_reserve_table"],
    canDeliverToCar: json["can_deliver_to_car"],
    canPickupOrder: json["can_pickup_order"],
    isOpen: json["is_open"],
    type: json["type"],
    logo: json["logo"],
    name: json["name"],
    cuisine: json["cuisine"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "preparation_time": preparationTime,
    "can_reserve_table": canReserveTable,
    "can_deliver_to_car": canDeliverToCar,
    "can_pickup_order": canPickupOrder,
    "is_open": isOpen,
    "type": type,
    "logo": logo,
    "name": name,
    "cuisine": cuisine,
    "lat": lat,
    "lng": lng,
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
  };}
  class OrderLine {
  OrderLine({
  this.id,
  this.itemId,
  this.extras,
  this.quantity,
  this.unitPrice,
  this.total,
  this.name,
  this.image,
  });

  String ?id;
  String? itemId;
  List<Extra>? extras;
  int ?quantity;
  int ?unitPrice;
  int ?total;
  String ?name;
  String ?image;

  factory OrderLine.fromJson(Map<String, dynamic> json) => OrderLine(
  id: json["id"],
  itemId: json["item_id"],
    extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
  quantity: json["quantity"],
  unitPrice: json["unit_price"],
  total: json["total"],
  name: json["name"],
  image: json["image"],
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "item_id": itemId,
  "extras": List<dynamic>.from(extras!.map((x) => x)),
  "quantity": quantity,
  "unit_price": unitPrice,
  "total": total,
  "name": name,
  "image": image,
  };
  }
class Extra {
  Extra({
    this.id,
    this.price,
    this.name,
  });

  String ?id;
  int ?price;
  String? name;

  factory Extra.fromJson(Map<String, dynamic> json) =>
      Extra(
        id: json["id"],
        price: json["price"],
        name: json["name"],
      );

}