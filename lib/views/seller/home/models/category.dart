import 'package:dukaan/views/seller/home/models/product.dart';

class Electronics {
  String? categoryName;
  int? categoryId;
  List<Product>? products;

  Electronics({
    this.categoryName,
    this.categoryId,
    this.products,
  });

  factory Electronics.fromJson(Map<String, dynamic> json) => Electronics(
        categoryName: json["category_name"],
        categoryId: json["category_id"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "category_id": categoryId,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
