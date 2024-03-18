import 'dart:convert';

class GetPostingByCategoriesResponseBody {
  final bool? success;
  final List<CategoriesDataModel>? data;

  GetPostingByCategoriesResponseBody({
    this.success,
    this.data,
  });

  factory GetPostingByCategoriesResponseBody.fromRawJson(String str) =>
      GetPostingByCategoriesResponseBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetPostingByCategoriesResponseBody.fromJson(
          Map<String, dynamic> json) =>
      GetPostingByCategoriesResponseBody(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<CategoriesDataModel>.from(
                json["data"]!.map((x) => CategoriesDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class CategoriesDataModel {
  final int? count;
  final String? iconUrl;
  final String? category;
  final List<Property>? properties;
  final List<String>? subcategories;

  CategoriesDataModel({
    this.count,
    this.iconUrl,
    this.category,
    this.properties,
    this.subcategories,
  });

  factory CategoriesDataModel.fromRawJson(String str) =>
      CategoriesDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataModel(
        count: json["count"],
        iconUrl: json["iconURL"],
        category: json["category"],
        properties: json["properties"] == null
            ? []
            : List<Property>.from(
                json["properties"]!.map((x) => Property.fromJson(x))),
        subcategories: json["subcategories"] == null
            ? []
            : List<String>.from(json["subcategories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "iconURL": iconUrl,
        "category": category,
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x!.toJson())),
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x)),
      };
}

class Property {
  final String? id;
  final String? key;
  final Value? value;

  Property({
    this.id,
    this.key,
    this.value,
  });

  factory Property.fromRawJson(String str) =>
      Property.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["_id"],
        key: json["key"],
        value: valueValues.map[json["value"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "key": key,
        "value": valueValues.reverse[value],
      };
}

enum Value { EMPTY, OPTIONAL }

final valueValues = EnumValues({"": Value.EMPTY, "Optional": Value.OPTIONAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
