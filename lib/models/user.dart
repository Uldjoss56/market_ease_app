import 'dart:convert';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? role;
  final dynamic phoneNumber;
  final dynamic company;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final dynamic currentTeamId;
  final dynamic profilePhotoPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic provider;
  final dynamic providerId;
  final dynamic providerToken;
  final dynamic username;
  final dynamic monthlySales;

  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phoneNumber,
    this.company,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.provider,
    this.providerId,
    this.providerToken,
    this.username,
    this.monthlySales,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        company: json["company"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        provider: json["provider"],
        providerId: json["provider_id"],
        providerToken: json["provider_token"],
        username: json["username"],
        monthlySales: json["monthly_sales"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "phone_number": phoneNumber,
        "company": company,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "provider": provider,
        "provider_id": providerId,
        "provider_token": providerToken,
        "username": username,
        "monthly_sales": monthlySales,
      };
}
