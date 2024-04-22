class OrderItem {
  int? quantity;
  String? varName;
  String? varProfit;
  String? varPrice;
  String? measurementUnit;
  String? measurementValue;
  String? varImgUrl;

  OrderItem({
    this.quantity,
    this.varName,
    this.varProfit,
    this.varPrice,
    this.measurementUnit,
    this.measurementValue,
    this.varImgUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        quantity: json["quantity"],
        varName: json["var_name"],
        varProfit: json["var_profit"],
        varPrice: json["var_price"],
        measurementUnit: json["measurement_unit"],
        measurementValue: json["measurement_value"],
        varImgUrl: json["var_img_url"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "var_name": varName,
        "var_profit": varProfit,
        "var_price": varPrice,
        "measurement_unit": measurementUnit,
        "measurement_value": measurementValue,
        "var_img_url": varImgUrl,
      };
}
