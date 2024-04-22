// To parse this JSON data, do
//
//     final customerAddress = customerAddressFromJson(jsonString);

import 'dart:convert';
import 'package:dukaan/views/seller/address/models/customer_address_data.dart';

CustomerAddress customerAddressFromJson(String str) =>
    CustomerAddress.fromJson(json.decode(str));

String customerAddressToJson(CustomerAddress data) =>
    json.encode(data.toJson());

class CustomerAddress {
  bool? success;
  String? msg;
  List<CustomerAddressData>? data;

  CustomerAddress({
    this.success,
    this.msg,
    this.data,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CustomerAddressData>.from(
                json["data"]!.map((x) => CustomerAddressData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
