// To parse this JSON data, do
//
//     final dropDownValues = dropDownValuesFromJson(jsonString);

import 'dart:convert';

DropDownValues dropDownValuesFromJson(String str) => DropDownValues.fromJson(json.decode(str));

String dropDownValuesToJson(DropDownValues data) => json.encode(data.toJson());

class DropDownValues {
  bool? success;
  String? msg;
  Data? data;

  DropDownValues({
    this.success,
    this.msg,
    this.data,
  });

  factory DropDownValues.fromJson(Map<String, dynamic> json) => DropDownValues(
    success: json["success"],
    msg: json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "data": data?.toJson(),
  };
}

class Data {
  List<Unit>? units;
  List<ProductCategory>? productCategories;

  Data({
    this.units,
    this.productCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    units: json["units"] == null ? [] : List<Unit>.from(json["units"]!.map((x) => Unit.fromJson(x))),
    productCategories: json["productCategories"] == null ? [] : List<ProductCategory>.from(json["productCategories"]!.map((x) => ProductCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "units": units == null ? [] : List<dynamic>.from(units!.map((x) => x.toJson())),
    "productCategories": productCategories == null ? [] : List<dynamic>.from(productCategories!.map((x) => x.toJson())),
  };
}

class ProductCategory {
  int? id;
  String? pcName;

  ProductCategory({
    this.id,
    this.pcName,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    pcName: json["pc_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pc_name": pcName,
  };
}

class Unit {
  int? id;
  String? unit;

  Unit({
    this.id,
    this.unit,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
  };
}
