// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:dukaan/views/vendor/product/models/data.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    bool? success;
    String? msg;
    List<Data>? data;

    Products({
        this.success,
        this.msg,
        this.data,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}



