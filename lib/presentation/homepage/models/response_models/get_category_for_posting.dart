import 'dart:convert';

class GetCategoriesForPostingResponseBody {
  final bool? success;
  final int? count;
  final List<String>? data;

  GetCategoriesForPostingResponseBody({
    this.success,
    this.count,
    this.data,
  });

  GetCategoriesForPostingResponseBody copyWith({
    bool? success,
    int? count,
    List<String>? data,
  }) =>
      GetCategoriesForPostingResponseBody(
        success: success ?? this.success,
        count: count ?? this.count,
        data: data ?? this.data,
      );

  factory GetCategoriesForPostingResponseBody.fromRawJson(String str) =>
      GetCategoriesForPostingResponseBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetCategoriesForPostingResponseBody.fromJson(
          Map<String, dynamic> json) =>
      GetCategoriesForPostingResponseBody(
        success: json["success"],
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
