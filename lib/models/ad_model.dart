import 'dart:convert';

AdsResponse adsResponseFromJson(String str) =>
    AdsResponse.fromJson(json.decode(str));

String adsResponseToJson(AdsResponse data) => json.encode(data.toJson());

class AdsResponse {
  final bool success;
  final List<AdModel> data;
  final String message;

  AdsResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  AdsResponse copyWith({bool? success, List<AdModel>? data, String? message}) =>
      AdsResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AdsResponse.fromJson(Map<String, dynamic> json) => AdsResponse(
    success: json["success"],
    data: List<AdModel>.from(json["data"].map((x) => AdModel.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class AdModel {
  final int id;
  final String title;
  final String url;
  final String image;

  AdModel({
    required this.id,
    required this.title,
    required this.url,
    required this.image,
  });

  AdModel copyWith({int? id, String? title, String? url, String? image}) =>
      AdModel(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        image: image ?? this.image,
      );

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "image": image,
  };
}
