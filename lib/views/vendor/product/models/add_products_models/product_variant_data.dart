import 'package:dukaan/views/vendor/product/models/add_products_models/product_variant_element.dart';

class ProductVariantData {
  List<ProductVariantElement>? productVariants;

  ProductVariantData({
    this.productVariants,
  });

  factory ProductVariantData.fromJson(Map<String, dynamic> json) =>
      ProductVariantData(
        productVariants: json["productVariants"] == null
            ? []
            : List<ProductVariantElement>.from(json["productVariants"]!
                .map((x) => ProductVariantElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productVariants": productVariants == null
            ? []
            : List<dynamic>.from(productVariants!.map((x) => x.toJson())),
      };
}
