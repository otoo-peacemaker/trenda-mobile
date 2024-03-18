import 'dart:convert';

class GetAllPostingResponseBody {
  final bool? success;
  final int? count;
  final Pagination? pagination;
  final List<PostingDataResponse>? postingResponseData;

  GetAllPostingResponseBody({
    this.success,
    this.count,
    this.pagination,
    this.postingResponseData,
  });

  GetAllPostingResponseBody copyWith({
    bool? success,
    int? count,
    Pagination? pagination,
    List<PostingDataResponse>? data,
  }) =>
      GetAllPostingResponseBody(
        success: success ?? this.success,
        count: count ?? this.count,
        pagination: pagination ?? this.pagination,
        postingResponseData: data ?? postingResponseData,
      );

  factory GetAllPostingResponseBody.fromRawJson(String str) =>
      GetAllPostingResponseBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllPostingResponseBody.fromJson(Map<String, dynamic> json) =>
      GetAllPostingResponseBody(
        success: json["success"],
        count: json["count"],
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        postingResponseData: json["data"] == null
            ? []
            : List<PostingDataResponse>.from(
                json["data"]!.map((x) => PostingDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "pagination": pagination?.toJson(),
        "data": postingResponseData == null
            ? []
            : List<dynamic>.from(postingResponseData!.map((x) => x.toJson())),
      };
}

class PostingDataResponse {
  final String? category;
  final String? packageType;
  final Status? status;
  final bool? negotiable;
  final bool? allowExchange;
  final bool? warranty;
  final bool? standingLocation;
  final int? postImpressions;
  final int? postViews;
  final String? id;
  final String? subcategory;
  final String? postTitle;
  final String? description;
  final ItemCondition? itemCondition;
  final String? region;
  final String? city;
  final String? address;
  final int? amount;
  final List<FeatureList>? featureList;
  final List<UploadedFile>? uploadedFiles;
  final String? user;
  final DateTime? createdAt;
  final List<dynamic>? bookmarks;
  final String? url;
  final String? postPath;
  final String? socialLink;
  final int? v;
  final DateTime? refreshedAt;

  PostingDataResponse({
    this.category,
    this.packageType,
    this.status,
    this.negotiable,
    this.allowExchange,
    this.warranty,
    this.standingLocation,
    this.postImpressions,
    this.postViews,
    this.id,
    this.subcategory,
    this.postTitle,
    this.description,
    this.itemCondition,
    this.region,
    this.city,
    this.address,
    this.amount,
    this.featureList,
    this.uploadedFiles,
    this.user,
    this.createdAt,
    this.bookmarks,
    this.url,
    this.postPath,
    this.socialLink,
    this.v,
    this.refreshedAt,
  });

  PostingDataResponse copyWith({
    String? category,
    String? packageType,
    Status? status,
    bool? negotiable,
    bool? allowExchange,
    bool? warranty,
    bool? standingLocation,
    int? postImpressions,
    int? postViews,
    String? id,
    String? subcategory,
    String? postTitle,
    String? description,
    ItemCondition? itemCondition,
    String? region,
    String? city,
    String? address,
    int? amount,
    List<FeatureList>? featureList,
    List<UploadedFile>? uploadedFiles,
    String? user,
    DateTime? createdAt,
    List<dynamic>? bookmarks,
    String? url,
    String? postPath,
    String? socialLink,
    int? v,
    DateTime? refreshedAt,
  }) =>
      PostingDataResponse(
        category: category ?? this.category,
        packageType: packageType ?? this.packageType,
        status: status ?? this.status,
        negotiable: negotiable ?? this.negotiable,
        allowExchange: allowExchange ?? this.allowExchange,
        warranty: warranty ?? this.warranty,
        standingLocation: standingLocation ?? this.standingLocation,
        postImpressions: postImpressions ?? this.postImpressions,
        postViews: postViews ?? this.postViews,
        id: id ?? this.id,
        subcategory: subcategory ?? this.subcategory,
        postTitle: postTitle ?? this.postTitle,
        description: description ?? this.description,
        itemCondition: itemCondition ?? this.itemCondition,
        region: region ?? this.region,
        city: city ?? this.city,
        address: address ?? this.address,
        amount: amount ?? this.amount,
        featureList: featureList ?? this.featureList,
        uploadedFiles: uploadedFiles ?? this.uploadedFiles,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        bookmarks: bookmarks ?? this.bookmarks,
        url: url ?? this.url,
        postPath: postPath ?? this.postPath,
        socialLink: socialLink ?? this.socialLink,
        v: v ?? this.v,
        refreshedAt: refreshedAt ?? this.refreshedAt,
      );

  factory PostingDataResponse.fromRawJson(String str) =>
      PostingDataResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostingDataResponse.fromJson(Map<String, dynamic> json) =>
      PostingDataResponse(
        category: json["category"],
        packageType: json["packageType"],
        status: statusValues.map[json["status"]]!,
        negotiable: json["negotiable"],
        allowExchange: json["allowExchange"],
        warranty: json["warranty"],
        standingLocation: json["standingLocation"],
        postImpressions: json["postImpressions"],
        postViews: json["postViews"],
        id: json["_id"],
        subcategory: json["subcategory"],
        postTitle: json["postTitle"],
        description: json["description"],
        itemCondition: itemConditionValues.map[json["itemCondition"]]!,
        region: json["region"],
        city: json["city"],
        address: json["address"],
        amount: json["amount"],
        featureList: json["featureList"] == null
            ? []
            : List<FeatureList>.from(
                json["featureList"]!.map((x) => FeatureList.fromJson(x))),
        uploadedFiles: json["uploadedFiles"] == null
            ? []
            : List<UploadedFile>.from(
                json["uploadedFiles"]!.map((x) => UploadedFile.fromJson(x))),
        user: json["user"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        bookmarks: json["bookmarks"] == null
            ? []
            : List<dynamic>.from(json["bookmarks"]!.map((x) => x)),
        url: json["url"],
        postPath: json["postPath"],
        socialLink: json["socialLink"],
        v: json["__v"],
        refreshedAt: json["refreshedAt"] == null
            ? null
            : DateTime.parse(json["refreshedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "packageType": packageType,
        "status": statusValues.reverse[status],
        "negotiable": negotiable,
        "allowExchange": allowExchange,
        "warranty": warranty,
        "standingLocation": standingLocation,
        "postImpressions": postImpressions,
        "postViews": postViews,
        "_id": id,
        "subcategory": subcategory,
        "postTitle": postTitle,
        "description": description,
        "itemCondition": itemConditionValues.reverse[itemCondition],
        "region": region,
        "city": city,
        "address": address,
        "amount": amount,
        "featureList": featureList == null
            ? []
            : List<dynamic>.from(featureList!.map((x) => x.toJson())),
        "uploadedFiles": uploadedFiles == null
            ? []
            : List<dynamic>.from(uploadedFiles!.map((x) => x.toJson())),
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "bookmarks": bookmarks == null
            ? []
            : List<dynamic>.from(bookmarks!.map((x) => x)),
        "url": url,
        "postPath": postPath,
        "socialLink": socialLink,
        "__v": v,
        "refreshedAt": refreshedAt?.toIso8601String(),
      };
}

class FeatureList {
  final String? id;
  final String? key;
  final String? value;

  FeatureList({
    this.id,
    this.key,
    this.value,
  });

  FeatureList copyWith({
    String? id,
    String? key,
    String? value,
  }) =>
      FeatureList(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory FeatureList.fromRawJson(String str) =>
      FeatureList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureList.fromJson(Map<String, dynamic> json) => FeatureList(
        id: json["_id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "key": key,
        "value": value,
      };
}

enum ItemCondition { BRAND_NEW, GOOD_CONDITION, SLIGHTLY_USED }

final itemConditionValues = EnumValues({
  "Brand New": ItemCondition.BRAND_NEW,
  "Good Condition": ItemCondition.GOOD_CONDITION,
  "Slightly Used": ItemCondition.SLIGHTLY_USED
});

enum Status { APPROVED, CLOSED }

final statusValues =
    EnumValues({"approved": Status.APPROVED, "closed": Status.CLOSED});

class UploadedFile {
  final String? id;
  final String? url;

  UploadedFile({
    this.id,
    this.url,
  });

  UploadedFile copyWith({
    String? id,
    String? url,
  }) =>
      UploadedFile(
        id: id ?? this.id,
        url: url ?? this.url,
      );

  factory UploadedFile.fromRawJson(String str) =>
      UploadedFile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UploadedFile.fromJson(Map<String, dynamic> json) => UploadedFile(
        id: json["_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
      };
}

class Pagination {
  final Next? next;

  Pagination({
    this.next,
  });

  Pagination copyWith({
    Next? next,
  }) =>
      Pagination(
        next: next ?? this.next,
      );

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        next: json["next"] == null ? null : Next.fromJson(json["next"]),
      );

  Map<String, dynamic> toJson() => {
        "next": next?.toJson(),
      };
}

class Next {
  final int? page;
  final int? limit;

  Next({
    this.page,
    this.limit,
  });

  Next copyWith({
    int? page,
    int? limit,
  }) =>
      Next(
        page: page ?? this.page,
        limit: limit ?? this.limit,
      );

  factory Next.fromRawJson(String str) => Next.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        page: json["page"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
