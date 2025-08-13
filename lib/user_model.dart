class UserModel {
  final String name;
  final String email;
  final String phone;

  UserModel({required this.name, required this.email, required this.phone});

  //copyWith
  //named constructor
  UserModel copyWith({String? name, String? email, String? phone}) => UserModel(
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
  );
}
