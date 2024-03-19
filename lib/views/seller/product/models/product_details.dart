// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:dukaan/views/seller/product/models/data.dart';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  bool? success;
  String? msg;
  Data? data;

  ProductDetails({
    this.success,
    this.msg,
    this.data,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data,
      };
}
