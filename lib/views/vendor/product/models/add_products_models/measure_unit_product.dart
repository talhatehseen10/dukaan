// To parse this JSON data, do
//
//     final measureUnitProduct = measureUnitProductFromJson(jsonString);

import 'dart:convert';

MeasureUnitProduct measureUnitProductFromJson(String str) => MeasureUnitProduct.fromJson(json.decode(str));

String measureUnitProductToJson(MeasureUnitProduct data) => json.encode(data.toJson());

class MeasureUnitProduct {
  bool? success;
  String? msg;
  Data? data;

  MeasureUnitProduct({
    this.success,
    this.msg,
    this.data,
  });

  factory MeasureUnitProduct.fromJson(Map<String, dynamic> json) => MeasureUnitProduct(
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
  String? unit;
  List<MeasurementValue>? measurementValues;

  Data({
    this.unit,
    this.measurementValues,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    unit: json["unit"],
    measurementValues: json["measurementValues"] == null ? [] : List<MeasurementValue>.from(json["measurementValues"]!.map((x) => MeasurementValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "unit": unit,
    "measurementValues": measurementValues == null ? [] : List<dynamic>.from(measurementValues!.map((x) => x.toJson())),
  };
}

class MeasurementValue {
  int? id;
  String? value;

  MeasurementValue({
    this.id,
    this.value,
  });

  factory MeasurementValue.fromJson(Map<String, dynamic> json) => MeasurementValue(
    id: json["id"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}
