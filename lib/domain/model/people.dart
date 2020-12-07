// ignore_for_file: public_member_api_docs

import 'dart:convert';

/// Model that holds people's property temporarily.
class PeopleModel {
  const PeopleModel({
    this.id,
    this.name,
    this.role,
  });

  factory PeopleModel.fromRawJson(String data) {
    return PeopleModel.fromJson(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
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
