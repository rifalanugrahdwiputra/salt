import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.data,
  });

  List<Data>? data;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<String>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": first_name,
        "last_name": first_name,
        "avatar": avatar,
      };
}
