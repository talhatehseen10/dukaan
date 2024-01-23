
import 'package:dukaan/views/home/models/image.dart';

class Product {
    int? id;
    String? name;
    String? rating;
    String? price;
    Images? images;

    Product({
        this.id,
        this.name,
        this.rating,
        this.price,
        this.images,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        rating: json["rating"],
        price: json["price"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "price": price,
        "images": images?.toJson(),
    };
}
