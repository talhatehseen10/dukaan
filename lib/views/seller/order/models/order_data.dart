import 'package:dukaan/views/seller/order/models/address.dart';
import 'package:dukaan/views/seller/order/models/order_item.dart';

class OrderData {
  int? orderId;
  String? orderDate;
  String? status;
  String? totalAmount;
  String? totalProfit;
  Address? address;
  List<OrderItem>? orderItems;

  OrderData({
    this.orderId,
    this.orderDate,
    this.status,
    this.totalAmount,
    this.totalProfit,
    this.address,
    this.orderItems,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        orderId: json["order_id"],
        orderDate: json["order_date"],
        status: json["status"],
        totalAmount: json["total_amount"],
        totalProfit: json["total_profit"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        orderItems: json["order_items"] == null
            ? []
            : List<OrderItem>.from(
                json["order_items"]!.map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_date": orderDate,
        "status": status,
        "total_amount": totalAmount,
        "total_profit": totalProfit,
        "address": address?.toJson(),
        "order_items": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}
