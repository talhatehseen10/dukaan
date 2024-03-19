class Images {
    int? id;
    String? imgUrl;
    String? imgName;
    String? imgDesc;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? productVariantId;

    Images({
        this.id,
        this.imgUrl,
        this.imgName,
        this.imgDesc,
        this.createdAt,
        this.updatedAt,
        this.productVariantId,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        imgUrl: json["img_url"],
        imgName: json["img_name"],
        imgDesc: json["img_desc"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        productVariantId: json["product_variant_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "img_url": imgUrl,
        "img_name": imgName,
        "img_desc": imgDesc,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_variant_id": productVariantId,
    };
}
