// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

import 'package:dukaan/views/vendor/home/models/dashboard_data.dart';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  bool? success;
  String? msg;
  DashboardData? data;

  Dashboard({
    this.success,
    this.msg,
    this.data,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        success: json["success"],
        msg: json["msg"],
        data:
            json["data"] == null ? null : DashboardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}
