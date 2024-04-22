class BagItemData {
  int? id;
  String? variantName;
  String? variantPrice;
  String? varaiantImgUrl;
  int? quantity;
  String? variantSize;
  int? variantPrdoductAvailQty;
  String? profit;
  String? vendorName;
  String? vendorImage;
  String? vendorShopLink;

  BagItemData({
    this.id,
    this.variantName,
    this.variantPrice,
    this.varaiantImgUrl,
    this.quantity,
    this.variantSize,
    this.variantPrdoductAvailQty,
    this.profit,
    this.vendorName,
    this.vendorImage,
    this.vendorShopLink,
  });

  factory BagItemData.fromJson(Map<String, dynamic> json) => BagItemData(
        id: json["id"],
        variantName: json["variant_name"],
        variantPrice: json["variant_price"],
        varaiantImgUrl: json["varaiant_img_url"],
        quantity: json["quantity"],
        variantSize: json["variant_size"],
        variantPrdoductAvailQty: json["variant_prdoductAvailQty"],
        profit: json["profit"],
        vendorName: json["vendor_name"],
        vendorImage: json["vendor_image"],
        vendorShopLink: json["vendor_shop_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variant_name": variantName,
        "variant_price": variantPrice,
        "varaiant_img_url": varaiantImgUrl,
        "quantity": quantity,
        "variant_size": variantSize,
        "variant_prdoductAvailQty": variantPrdoductAvailQty,
        "profit": profit,
        "vendor_name": vendorName,
        "vendor_image": vendorImage,
        "vendor_shop_link": vendorShopLink,
      };
}
