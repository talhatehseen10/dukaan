// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';
import 'package:dukaan/views/notification/models/notification_data.dart';

Notification notificationFromJson(String str) =>
    Notification.fromJson(json.decode(str));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification {
  bool? success;
  String? msg;
  List<NotificationData>? data;

  Notification({
    this.success,
    this.msg,
    this.data,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<NotificationData>.from(
                json["data"]!.map((x) => NotificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
