class ProductVariantElement {
  int? id;
  int? varProductId;
  String? varName;
  String? varPrice;
  String? varMeasurementValue;
  String? varMeasurementUnit;
  String? imageUrl;

  ProductVariantElement({
    this.id,
    this.varProductId,
    this.varName,
    this.varPrice,
    this.varMeasurementValue,
    this.varMeasurementUnit,
    this.imageUrl,
  });

  factory ProductVariantElement.fromJson(Map<String, dynamic> json) =>
      ProductVariantElement(
        id: json["id"],
        varProductId: json["var_product_id"],
        varName: json["var_name"],
        varPrice: json["var_price"],
        varMeasurementValue: json["var_measurement_value"],
        varMeasurementUnit: json["var_measurement_unit"],
        imageUrl: json["images"]["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "var_product_id": varProductId,
        "var_name": varName,
        "var_price": varPrice,
        "var_measurement_value": varMeasurementValue,
        "var_measurement_unit": varMeasurementUnit,
        "images": imageUrl,
      };
}
