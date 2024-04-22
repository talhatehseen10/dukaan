class Product {
  int? productId;
  String? productName;
  String? productPrice;
  String? productImage;
  String? productRating;

  Product({
    this.productId,
    this.productName,
    this.productPrice,
    this.productImage,
    this.productRating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        productPrice: json["productPrice"],
        productImage: json["productImage"],
        productRating: json["productRating"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productPrice": productPrice,
        "productImage": productImage,
        "productRating": productRating,
      };
}
