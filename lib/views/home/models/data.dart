
import 'package:dukaan/views/home/models/category.dart';

class Data {
    Electronics? electronics;

    Data({
        this.electronics,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        electronics: json["Electronics"] == null ? null : Electronics.fromJson(json["Electronics"]),
    );

    Map<String, dynamic> toJson() => {
        "Electronics": electronics?.toJson(),
    };
}
