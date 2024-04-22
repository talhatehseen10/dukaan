// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:dukaan/views/seller/category/models/category_data.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  bool? success;
  String? msg;
  List<CategoryData>? data;

  Category({
    this.success,
    this.msg,
    this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CategoryData>.from(
                json["data"]!.map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
