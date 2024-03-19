class ProductVariant {
  int? id;
  int? varProductId;
  String? varName;
  String? varPrice;
  int? varQuantityTotal;
  int? varQuantityAvailable;
  String? varMeasurementUnit;
  String? varMeasurementValue;
  int? varLikes;
  String? varRating;
  String? image;

  ProductVariant({
    this.id,
    this.varProductId,
    this.varName,
    this.varPrice,
    this.varQuantityTotal,
    this.varQuantityAvailable,
    this.varMeasurementUnit,
    this.varMeasurementValue,
    this.varLikes,
    this.varRating,
    this.image,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        id: json["id"],
        varProductId: json["var_product_id"],
        varName: json["var_name"],
        varPrice: json["var_price"],
        varQuantityTotal: json["var_quantity_total"],
        varQuantityAvailable: json["var_quantity_available"],
        varMeasurementUnit: json["var_measurement_unit"],
        varMeasurementValue: json["var_measurement_value"],
        varLikes: json["var_likes"],
        varRating: json["var_rating"],
        image: json["images"]["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "var_product_id": varProductId,
        "var_name": varName,
        "var_price": varPrice,
        "var_quantity_total": varQuantityTotal,
        "var_quantity_available": varQuantityAvailable,
        "var_measurement_unit": varMeasurementUnit,
        "var_measurement_value": varMeasurementValue,
        "var_likes": varLikes,
        "var_rating": varRating,
        "images": image,
      };
}
