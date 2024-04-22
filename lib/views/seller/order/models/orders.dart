// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

import 'package:dukaan/views/seller/order/models/order_data.dart';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  bool? success;
  String? msg;
  List<OrderData>? data;

  Orders({
    this.success,
    this.msg,
    this.data,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<OrderData>.from(
                json["data"]!.map((x) => OrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
