import 'package:dukaan/views/seller/home/models/product.dart';

class Datum {
  String? categoryName;
  List<Product>? products;

  Datum({
    this.categoryName,
    this.products,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryName: json["categoryName"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
