class Images {
    String? imgUrl;
    String? imgName;

    Images({
        this.imgUrl,
        this.imgName,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        imgUrl: json["img_url"],
        imgName: json["img_name"],
    );

    Map<String, dynamic> toJson() => {
        "img_url": imgUrl,
        "img_name": imgName,
    };
}