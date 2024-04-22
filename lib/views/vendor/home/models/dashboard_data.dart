import 'package:dukaan/views/vendor/home/models/metric.dart';

class DashboardData {
  List<Metric>? metrics;
  List<String>? banners;

  DashboardData({
    this.metrics,
    this.banners,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        metrics: json["metrics"] == null
            ? []
            : List<Metric>.from(
                json["metrics"]!.map((x) => Metric.fromJson(x))),
        banners: json["banners"] == null
            ? []
            : List<String>.from(json["banners"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "metrics": metrics == null
            ? []
            : List<dynamic>.from(metrics!.map((x) => x.toJson())),
        "banners":
            banners == null ? [] : List<dynamic>.from(banners!.map((x) => x)),
      };
}
