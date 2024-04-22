class Address {
  int? id;
  int? customerId;
  int? provinceId;
  int? cityId;
  String? area;
  String? house;
  String? street;
  String? nearbyLandmark;
  String? addressType;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Address({
    this.id,
    this.customerId,
    this.provinceId,
    this.cityId,
    this.area,
    this.house,
    this.street,
    this.nearbyLandmark,
    this.addressType,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        customerId: json["customer_id"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        area: json["area"],
        house: json["house"],
        street: json["street"],
        nearbyLandmark: json["nearby_landmark"],
        addressType: json["address_type"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "province_id": provinceId,
        "city_id": cityId,
        "area": area,
        "house": house,
        "street": street,
        "nearby_landmark": nearbyLandmark,
        "address_type": addressType,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
