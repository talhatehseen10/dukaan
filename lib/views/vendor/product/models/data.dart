import 'package:dukaan/views/vendor/product/models/category.dart';

class Data {
    int? id;
    dynamic createdAt;
    dynamic updatedAt;
    String? pName;
    String? pDescription;
    int? pVendorId;
    int? pCategoryId;
    int? status;
    String? pMeasurementUnit;
    Category? category;

    Data({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.pName,
        this.pDescription,
        this.pVendorId,
        this.pCategoryId,
        this.status,
        this.pMeasurementUnit,
        this.category,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pName: json["p_name"],
        pDescription: json["p_description"],
        pVendorId: json["p_vendor_id"],
        pCategoryId: json["p_category_id"],
        status: json["status"],
        pMeasurementUnit: json["p_measurement_unit"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "p_name": pName,
        "p_description": pDescription,
        "p_vendor_id": pVendorId,
        "p_category_id": pCategoryId,
        "status": status,
        "p_measurement_unit": pMeasurementUnit,
        "category": category?.toJson(),
    };
}