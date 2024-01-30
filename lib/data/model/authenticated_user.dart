import 'dart:convert';

import 'package:e_com_app/data/model/user.dart';

class AuthenticatedUser {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final User? user;

  AuthenticatedUser({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  factory AuthenticatedUser.fromRawJson(String str) =>
      AuthenticatedUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      AuthenticatedUser(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user?.toJson(),
      };
}
