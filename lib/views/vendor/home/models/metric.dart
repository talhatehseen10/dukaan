class Metric {
  String? name;
  int? value;

  Metric({
    this.name,
    this.value,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
