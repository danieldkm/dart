import 'dart:convert';

import 'package:dart_async/7_modelos/user_types.dart';

class User {
  final String id;
  final String name;
  final String userName;
  final List<UserTypes> userTypes;
  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.userTypes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'user_types': userTypes.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        userName: map['userName'] ?? '',
        userTypes: map['user_types']
                ?.map<UserTypes>((type) => UserTypes.fromMap(type))
                .toList() ??
            []
        // Gerado automaticamente
        // userTypes: List<UserTypes>.from(
        //   map['userTypes']?.map((x) => UserTypes.fromMap(x)),
        // ),
        );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, userName: $userName, userTypes: $userTypes)';
  }
}
