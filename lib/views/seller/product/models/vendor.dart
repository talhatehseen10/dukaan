class Vendor {
  int? id;
  String? vName;
  String? vImage;
  String? vRating;
  String? vFollowers;
  String? vShopUrl;
  int? productsCount;

  Vendor({
    this.id,
    this.vName,
    this.vImage,
    this.vRating,
    this.vFollowers,
    this.vShopUrl,
    this.productsCount,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        vName: json["v_name"],
        vImage: json["v_image"],
        vRating: json["v_rating"],
        vFollowers: json["v_followers"],
        vShopUrl: json["v_shop_URL"],
        productsCount: json["products_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "v_name": vName,
        "v_image": vImage,
        "v_rating": vRating,
        "v_followers": vFollowers,
        "v_shop_URL": vShopUrl,
        "products_count": productsCount,
      };
}
