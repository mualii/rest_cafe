// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int ?currentPage;
  List<Datum> ?data;
  String ?firstPageUrl;
  int ?from;
  int ?lastPage;
  String ?lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String ?path;
  int ?perPage;
  dynamic prevPageUrl;
  int ?to;
  int ?total;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.type,
    this.readAt,
    this.createdAt,
    this.orderNumber,
    this.message,
    this.orderId,
    this.restaurant
  });

  int ?id;
  String ?type;
  dynamic readAt;
  String ? restaurant;
  DateTime? createdAt;
  String ?orderNumber;
  String ?message;
  String ?orderId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    restaurant: json["restaurant"],
    type: json["type"],
    readAt: json["read_at"],
    createdAt: DateTime.parse(json["created_at"]),
    orderNumber: json["order_number"],
    message: json["message"],
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "read_at": readAt,
    "created_at": createdAt!.toIso8601String(),
    "order_number": orderNumber,
    "message": message,
    "order_id": orderId,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String ?url;
  String ?label;
  bool ?active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}
