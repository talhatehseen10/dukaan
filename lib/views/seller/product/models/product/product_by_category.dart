// To parse this JSON data, do
//
//     final productByCategory = productByCategoryFromJson(jsonString);

import 'dart:convert';
import 'package:dukaan/views/seller/product/models/product/data.dart';

ProductByCategory productByCategoryFromJson(String str) =>
    ProductByCategory.fromJson(json.decode(str));

String productByCategoryToJson(ProductByCategory data) =>
    json.encode(data.toJson());

class ProductByCategory {
  bool? success;
  String? msg;
  List<Data>? data;

  ProductByCategory({
    this.success,
    this.msg,
    this.data,
  });

  factory ProductByCategory.fromJson(Map<String, dynamic> json) =>
      ProductByCategory(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
