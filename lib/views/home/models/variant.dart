import 'package:dukaan/views/home/models/image.dart';

class Variant {
    String? variantName;
    String? variantPrice;
    String? varRating;
    Images? images;

    Variant({
        this.variantName,
        this.variantPrice,
        this.varRating,
        this.images,
    });

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantName: json["variantName"],
        variantPrice: json["variantPrice"],
        varRating: json["var_rating"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
    );

    Map<String, dynamic> toJson() => {
        "variantName": variantName,
        "variantPrice": variantPrice,
        "var_rating": varRating,
        "images": images?.toJson(),
    };
}