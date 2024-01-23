class Data {
  String? token;
  String? name;
  String? email;
  String? role;

  Data({
    this.token,
    this.name,
    this.email,
    this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        email: json["email"],
        role: json["user_type"]
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "email": email,
        "user_type": role
      };
}
