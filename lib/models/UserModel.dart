// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:flutter_vpn21/service/IRepositoryService.dart';

class UsersModel {
  UsersModel({
    this.user,
  });

  List<User>? user;

  factory UsersModel.fromRawJson(String str) =>
      UsersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null
            ? null
            : List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.id,
    this.adminBalls,
    this.email,
    this.floor,
    this.name,
    this.obshaga,
    this.patronymic,
    this.permissions,
    this.room,
    this.ssoBalls,
    this.surName,
    this.hisoryWork,
  });

  int? adminBalls;
  String? email;
  String? floor;
  String? name;
  String? obshaga;
  String? patronymic;
  String? permissions;
  String? room;
  int? ssoBalls;
  String? surName;
  List<HisoryWork>? hisoryWork;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        adminBalls: json["AdminBalls"] ?? null,
        email: json["Email"] ?? null,
        floor: json["Floor"] ?? null,
        name: json["Name"] ?? null,
        obshaga: json["Obshaga"] ?? null,
        patronymic: json["Patronymic"] ?? null,
        permissions: json["Permissions"] ?? null,
        room: json["Room"] ?? null,
        ssoBalls: json["SsoBalls"] ?? null,
        surName: json["SurName"] ?? null,
        hisoryWork: json["HisoryWork"] == null
            ? null
            : List<HisoryWork>.from(
                json["HisoryWork"].map((x) => HisoryWork.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AdminBalls": adminBalls ?? null,
        "Email": email ?? null,
        "Floor": floor ?? null,
        "Name": name ?? null,
        "Obshaga": obshaga ?? null,
        "Patronymic": patronymic ?? null,
        "Permissions": permissions ?? null,
        "Room": room ?? null,
        "SsoBalls": ssoBalls ?? null,
        "SurName": surName ?? null,
        "HisoryWork": hisoryWork == null
            ? null
            : List<dynamic>.from(hisoryWork!.map((x) => x.toJson())),
      };

  @override
  String? id;
}

class HisoryWork {
  HisoryWork({
    this.id,
    this.progresio,
  });

  String? id;
  String? progresio;

  factory HisoryWork.fromRawJson(String str) =>
      HisoryWork.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HisoryWork.fromJson(Map<String, dynamic> json) => HisoryWork(
        id: json["id"] ?? null,
        progresio: json["progresio"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "progresio": progresio ?? null,
      };
}
