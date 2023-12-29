class Data {
    String? token;
    String? name;
    String? email;
    
    Data({
        this.token,
        this.name,
        this.email,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "email": email,
    };
}
