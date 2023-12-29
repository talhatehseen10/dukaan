

import 'package:dukaan/views/authentication/models/data.dart';

class LoginModel {
    bool? success;
    Data? data;
    String? msg;

    LoginModel({
        this.success,
        this.data,
        this.msg,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "msg": msg,
    };
}

