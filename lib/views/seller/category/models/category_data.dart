class CategoryData {
  int? id;
  String? pcName;
  String? imgUrl;

  CategoryData({
    this.id,
    this.pcName,
    this.imgUrl,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        pcName: json["pc_name"],
        imgUrl: json["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pc_name": pcName,
        "img_url": imgUrl,
      };
}
