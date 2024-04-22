import 'package:dukaan/views/seller/product/models/product/product.dart';

class Data {
  String? categoryName;
  List<Product>? products;

  Data({
    this.categoryName,
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
