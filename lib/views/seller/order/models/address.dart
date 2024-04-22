class Address {
  int? customerId;
  int? provinceId;
  int? cityId;
  String? area;
  String? house;
  String? street;
  String? nearbyLandmark;
  String? addressType;
  String? cityName;
  String? provinceName;
  String? name;
  String? phone;
  String? phone2;

  Address({
    this.customerId,
    this.provinceId,
    this.cityId,
    this.area,
    this.house,
    this.street,
    this.nearbyLandmark,
    this.addressType,
    this.cityName,
    this.provinceName,
    this.name,
    this.phone,
    this.phone2,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        customerId: json["customer_id"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        area: json["area"],
        house: json["house"],
        street: json["street"],
        nearbyLandmark: json["nearby_landmark"],
        addressType: json["address_type"],
        cityName: json["cityName"],
        provinceName: json["provinceName"],
        name: json["name"],
        phone: json["phone"],
        phone2: json["phone2"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "province_id": provinceId,
        "city_id": cityId,
        "area": area,
        "house": house,
        "street": street,
        "nearby_landmark": nearbyLandmark,
        "address_type": addressType,
        "cityName": cityName,
        "provinceName": provinceName,
        "name": name,
        "phone": phone,
        "phone2": phone2,
      };
}
