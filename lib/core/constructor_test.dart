//constructor

class UserModel {
  String name;
  String email;
  int age;
  String phone;

  //constructor  : create instance of the class
  UserModel({
    required this.name,
    required this.email,
    required this.age,
    required this.phone,
  });

  //named constructor  : copyWith
  UserModel copyWith({String? name, String? email, int? age, String? phone}) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      phone: phone ?? this.phone,
    );
  }

  // creational design pattern
  // factory constructor : create instance of the class from json
  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(name: json['name']);
  // }
}
