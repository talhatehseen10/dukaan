import 'dart:convert';
import 'package:dukaan/views/vendor/product/models/add_products_models/product_variant_data.dart';

ProductVariant productVariantFromJson(String str) =>
    ProductVariant.fromJson(json.decode(str));

String productVariantToJson(ProductVariant data) => json.encode(data.toJson());

class ProductVariant {
  bool? success;
  String? msg;
  ProductVariantData? data;

  ProductVariant({
    this.success,
    this.msg,
    this.data,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? null
            : ProductVariantData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}
