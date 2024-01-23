class Category {
    int? id;
    String? pcName;

    Category({
        this.id,
        this.pcName,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        pcName: json["pc_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pc_name": pcName,
    };
}
