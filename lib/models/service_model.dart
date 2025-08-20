class ServiceResponse {
  final bool success;
  final Data data;
  final String message;

  //constructor
  ServiceResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  //copyWith
  //named constructor
  ServiceResponse copyWith({bool? success, Data? data, String? message}) =>
      ServiceResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  //factory constructor
  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      ServiceResponse(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  final List<ServiceModel> data;

  Data({required this.data});

  Data copyWith({List<ServiceModel>? data}) => Data(data: data ?? this.data);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<ServiceModel>.from(
      json["data"].map((x) => ServiceModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ServiceModel {
  final int id;
  final String type;
  final String name;
  final String title;
  final String cover;
  final String price;

  ServiceModel({
    required this.id,
    required this.type,
    required this.name,
    required this.title,
    required this.cover,
    required this.price,
  });

  ServiceModel copyWith({
    int? id,
    String? type,
    String? name,
    String? title,
    String? cover,
    String? price,
  }) => ServiceModel(
    id: id ?? this.id,
    type: type ?? this.type,
    name: name ?? this.name,
    title: title ?? this.title,
    cover: cover ?? this.cover,
    price: price ?? this.price,
  );

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    title: json["title"],
    cover: json["cover"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "title": title,
    "cover": cover,
    "price": price,
  };
}
