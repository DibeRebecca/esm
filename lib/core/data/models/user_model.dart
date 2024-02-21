import 'package:esm/core/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.email,
      required super.name,
      required super.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      id: json['id'],
    );
  }
}
