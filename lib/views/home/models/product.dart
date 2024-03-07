import 'package:dukaan/views/home/models/variant.dart';

class Product {
    String? productName;
    List<Variant>? variants;

    Product({
        this.productName,
        this.variants,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["productName"],
        variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
    };
}
