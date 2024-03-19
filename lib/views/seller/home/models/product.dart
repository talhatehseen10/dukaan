class Product {
  String? productId;
  String? productName;
  String? productImage;
  String? productPrice;

  Product(
      {this.productName, this.productImage, this.productPrice, this.productId});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"].toString(),
        productName: json["productName"],
        productImage: json["productImage"] ?? "",
        productPrice: json["productPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
      };
}
