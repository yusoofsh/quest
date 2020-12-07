/// {@template people_model}
/// Model that holds people's property temporarily.
/// {@endtemplate}
class PeopleModel {
  /// {@macro people_model}
  const PeopleModel({
    this.id,
    this.name,
    this.role,
  });

  /// Factories convert from JSON.
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
}
