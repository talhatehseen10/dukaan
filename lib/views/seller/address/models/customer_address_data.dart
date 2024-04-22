class CustomerAddressData {
  int? id;
  String? name;
  String? phone;
  String? phone2;
  int? userId;
  int? addressId;
  int? provinceId;
  int? cityId;
  String? area;
  String? house;
  String? street;
  String? nearbyLandmark;
  String? addressType;
  int? status;

  CustomerAddressData({
    this.id,
    this.name,
    this.phone,
    this.phone2,
    this.userId,
    this.addressId,
    this.provinceId,
    this.cityId,
    this.area,
    this.house,
    this.street,
    this.nearbyLandmark,
    this.addressType,
    this.status,
  });

  factory CustomerAddressData.fromJson(Map<String, dynamic> json) =>
      CustomerAddressData(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        phone2: json["phone2"],
        userId: json["user_id"],
        addressId: json["address_id"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        area: json["area"],
        house: json["house"],
        street: json["street"],
        nearbyLandmark: json["nearby_landmark"],
        addressType: json["address_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "phone2": phone2,
        "user_id": userId,
        "address_id": addressId,
        "province_id": provinceId,
        "city_id": cityId,
        "area": area,
        "house": house,
        "street": street,
        "nearby_landmark": nearbyLandmark,
        "address_type": addressType,
        "status": status,
      };
}
