import 'dart:convert';

class AuthenticationResponseBody {
  final bool? success;
  final String? message;
  final String? error;
  final String? token;
  final String? refreshToken;

  AuthenticationResponseBody({
    this.success,
    this.message,
    this.error,
    this.token,
    this.refreshToken,
  });

  AuthenticationResponseBody copyWith({
    bool? success,
    String? message,
    String? error,
    String? token,
    String? refreshToken,
  }) =>
      AuthenticationResponseBody(
        success: success ?? this.success,
        message: message ?? this.message,
        error: error ?? this.error,
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory AuthenticationResponseBody.fromRawJson(String str) =>
      AuthenticationResponseBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthenticationResponseBody.fromJson(Map<String, dynamic> json) =>
      AuthenticationResponseBody(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        token: json["token"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "token": token,
        "refreshToken": refreshToken,
      };
}
