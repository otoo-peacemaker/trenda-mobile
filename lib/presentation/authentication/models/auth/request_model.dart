import 'dart:convert';

class AuthenticationRequestBody {
  final String? email;
  final String? password;
  final String? mobile;
  final String? name;
  final String? referredBy;

  AuthenticationRequestBody({
    this.email,
    this.password,
    this.mobile,
    this.name,
    this.referredBy,
  });

  AuthenticationRequestBody copyWith({
    String? email,
    String? password,
    String? mobile,
    String? name,
    String? referredBy,
  }) =>
      AuthenticationRequestBody(
        email: email ?? this.email,
        password: password ?? this.password,
        mobile: mobile ?? this.mobile,
        name: name ?? this.name,
        referredBy: referredBy ?? this.referredBy,
      );

  factory AuthenticationRequestBody.fromRawJson(String str) =>
      AuthenticationRequestBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthenticationRequestBody.fromJson(Map<String, dynamic> json) =>
      AuthenticationRequestBody(
        email: json["email"],
        password: json["password"],
        mobile: json["mobile"],
        name: json["name"],
        referredBy: json["referredBy"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "mobile": mobile,
        "name": name,
        "referredBy": referredBy,
      };
}
