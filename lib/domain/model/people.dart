// ignore_for_file: public_member_api_docs

import 'dart:convert';

/// Model that holds people's property temporarily.
class People {
  const People({
    this.id,
    this.name,
    this.role,
  });

  factory People.fromRawJson(String data) {
    return People.fromJson(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
    );
  }

  final int id;
  final String name;
  final String role;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'role': role,
    };
  }
}
