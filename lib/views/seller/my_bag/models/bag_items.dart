// To parse this JSON data, do
//
//     final bagItems = bagItemsFromJson(jsonString);

import 'dart:convert';
import 'package:dukaan/views/seller/my_bag/models/bag_item_data.dart';

BagItems bagItemsFromJson(String str) => BagItems.fromJson(json.decode(str));

String bagItemsToJson(BagItems data) => json.encode(data.toJson());

class BagItems {
  bool? success;
  String? msg;
  List<BagItemData>? data;

  BagItems({
    this.success,
    this.msg,
    this.data,
  });

  factory BagItems.fromJson(Map<String, dynamic> json) => BagItems(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<BagItemData>.from(
                json["data"]!.map((x) => BagItemData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
