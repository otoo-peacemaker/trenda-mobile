import 'dart:convert';

class GetPostBySlugResponseBody {
  final bool? success;
  final Data? data;

  GetPostBySlugResponseBody({
    this.success,
    this.data,
  });

  GetPostBySlugResponseBody copyWith({
    bool? success,
    Data? data,
  }) =>
      GetPostBySlugResponseBody(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory GetPostBySlugResponseBody.fromRawJson(String str) =>
      GetPostBySlugResponseBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetPostBySlugResponseBody.fromJson(Map<String, dynamic> json) =>
      GetPostBySlugResponseBody(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final String? category;
  final String? packageType;
  final String? status;
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
  final String? itemCondition;
  final String? region;
  final String? city;
  final String? address;
  final int? amount;
  final List<FeatureLists>? featureList;
  final List<UploadedFile>? uploadedFiles;
  final User? user;
  final DateTime? createdAt;
  final String? url;
  final String? postPath;
  final String? socialLink;
  final int? v;
  final DateTime? refreshedAt;

  Data({
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
    this.url,
    this.postPath,
    this.socialLink,
    this.v,
    this.refreshedAt,
  });

  Data copyWith({
    String? category,
    String? packageType,
    String? status,
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
    String? itemCondition,
    String? region,
    String? city,
    String? address,
    int? amount,
    List<FeatureLists>? featureList,
    List<UploadedFile>? uploadedFiles,
    User? user,
    DateTime? createdAt,
    String? url,
    String? postPath,
    String? socialLink,
    int? v,
    DateTime? refreshedAt,
  }) =>
      Data(
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
        url: url ?? this.url,
        postPath: postPath ?? this.postPath,
        socialLink: socialLink ?? this.socialLink,
        v: v ?? this.v,
        refreshedAt: refreshedAt ?? this.refreshedAt,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: json["category"],
        packageType: json["packageType"],
        status: json["status"],
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
        itemCondition: json["itemCondition"],
        region: json["region"],
        city: json["city"],
        address: json["address"],
        amount: json["amount"],
        featureList: json["featureList"] == null
            ? []
            : List<FeatureLists>.from(
                json["featureList"]!.map((x) => FeatureLists.fromJson(x))),
        uploadedFiles: json["uploadedFiles"] == null
            ? []
            : List<UploadedFile>.from(
                json["uploadedFiles"]!.map((x) => UploadedFile.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
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
        "status": status,
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
        "itemCondition": itemCondition,
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
        "user": user?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "url": url,
        "postPath": postPath,
        "socialLink": socialLink,
        "__v": v,
        "refreshedAt": refreshedAt?.toIso8601String(),
      };
}

class FeatureLists {
  final String? id;
  final String? key;
  final String? value;

  FeatureLists({
    this.id,
    this.key,
    this.value,
  });

  FeatureLists copyWith({
    String? id,
    String? key,
    String? value,
  }) =>
      FeatureLists(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
      );

  factory FeatureLists.fromRawJson(String str) =>
      FeatureLists.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureLists.fromJson(Map<String, dynamic> json) => FeatureLists(
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

class User {
  final bool? userVerifiedById;
  final String? id;
  final String? name;
  final int? mobile;
  final DateTime? createdAt;
  final DateTime? lastLogin;
  final String? userSubdomain;

  User({
    this.userVerifiedById,
    this.id,
    this.name,
    this.mobile,
    this.createdAt,
    this.lastLogin,
    this.userSubdomain,
  });

  User copyWith({
    bool? userVerifiedById,
    String? id,
    String? name,
    int? mobile,
    DateTime? createdAt,
    DateTime? lastLogin,
    String? userSubdomain,
  }) =>
      User(
        userVerifiedById: userVerifiedById ?? this.userVerifiedById,
        id: id ?? this.id,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        createdAt: createdAt ?? this.createdAt,
        lastLogin: lastLogin ?? this.lastLogin,
        userSubdomain: userSubdomain ?? this.userSubdomain,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userVerifiedById: json["userVerifiedById"],
        id: json["_id"],
        name: json["name"],
        mobile: json["mobile"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        lastLogin: json["lastLogin"] == null
            ? null
            : DateTime.parse(json["lastLogin"]),
        userSubdomain: json["userSubdomain"],
      );

  Map<String, dynamic> toJson() => {
        "userVerifiedById": userVerifiedById,
        "_id": id,
        "name": name,
        "mobile": mobile,
        "createdAt": createdAt?.toIso8601String(),
        "lastLogin": lastLogin?.toIso8601String(),
        "userSubdomain": userSubdomain,
      };
}
