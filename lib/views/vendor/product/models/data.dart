import 'package:dukaan/views/vendor/product/models/category.dart';

class Data {
    int? id;
    dynamic createdAt;
    dynamic updatedAt;
    String? pCode;
    String? pName;
    int? pLikes;
    String? pDeliveryTime;
    String? pRating;
    String? pDescription;
    String? pReturnPolicy;
    String? pPrice;
    String? pDiscount;
    String? pDeliveryFee;
    int? pQuantityTotal;
    int? pQuantityAvailable;
    int? pVendorId;
    int? pCategoryId;
    int? status;
    Category? category;

    Data({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.pCode,
        this.pName,
        this.pLikes,
        this.pDeliveryTime,
        this.pRating,
        this.pDescription,
        this.pReturnPolicy,
        this.pPrice,
        this.pDiscount,
        this.pDeliveryFee,
        this.pQuantityTotal,
        this.pQuantityAvailable,
        this.pVendorId,
        this.pCategoryId,
        this.status,
        this.category,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pCode: json["p_code"],
        pName: json["p_name"],
        pLikes: json["p_likes"],
        pDeliveryTime: json["p_delivery_time"],
        pRating: json["p_rating"],
        pDescription: json["p_description"],
        pReturnPolicy: json["p_return_policy"],
        pPrice: json["p_price"],
        pDiscount: json["p_discount"],
        pDeliveryFee: json["p_delivery_fee"],
        pQuantityTotal: json["p_quantity_total"],
        pQuantityAvailable: json["p_quantity_available"],
        pVendorId: json["p_vendor_id"],
        pCategoryId: json["p_category_id"],
        status: json["status"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "p_code": pCode,
        "p_name": pName,
        "p_likes": pLikes,
        "p_delivery_time": pDeliveryTime,
        "p_rating": pRating,
        "p_description": pDescription,
        "p_return_policy": pReturnPolicy,
        "p_price": pPrice,
        "p_discount": pDiscount,
        "p_delivery_fee": pDeliveryFee,
        "p_quantity_total": pQuantityTotal,
        "p_quantity_available": pQuantityAvailable,
        "p_vendor_id": pVendorId,
        "p_category_id": pCategoryId,
        "status": status,
        "category": category?.toJson(),
    };
}