import 'package:dukaan/views/seller/product/models/product_variant.dart';
import 'package:dukaan/views/seller/product/models/vendor.dart';

class Data {
  int? id;
  String? pName;
  String? pDescription;
  int? pVendorId;
  dynamic category;
  List<ProductVariant>? productVariant;
  Vendor? vendor;

  Data({
    this.id,
    this.pName,
    this.pDescription,
    this.pVendorId,
    this.category,
    this.productVariant,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        pName: json["p_name"],
        pDescription: json["p_description"],
        pVendorId: json["p_vendor_id"],
        category: json["category"] ?? "",
        productVariant: json["product_variant"] == null
            ? []
            : List<ProductVariant>.from(json["product_variant"]!
                .map((x) => ProductVariant.fromJson(x))),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "p_name": pName,
        "p_description": pDescription,
        "p_vendor_id": pVendorId,
        "category": category,
        "product_variant": productVariant == null
            ? []
            : List<dynamic>.from(productVariant!.map((x) => x.toJson())),
        "vendor": vendor?.toJson(),
      };
}
