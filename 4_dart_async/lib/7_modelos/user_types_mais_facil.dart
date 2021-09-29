import 'dart:convert';

class UserTypesMaisFacil {
  final String id;
  final String userId;
  final String name;
  UserTypesMaisFacil({
    required this.id,
    required this.userId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
    };
  }

  factory UserTypesMaisFacil.fromMap(Map<String, dynamic> map) {
    return UserTypesMaisFacil(
      id: map['id'],
      userId: map['userId'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTypesMaisFacil.fromJson(String source) =>
      UserTypesMaisFacil.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserTypesMaisFacil(id: $id, userId: $userId, name: $name)';
}
