import 'dart:convert';

//wykonywane najpierw
class Monuments {
  final String id;
  final String name;
  final String description;
  final String long_description;
  final String street;

  const Monuments({
    required this.id,
    required this.name,
    required this.description,
    required this.long_description,
    required this.street,
  });

  factory Monuments.fromJson(Map<String, dynamic> json) {
    return Monuments(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      long_description: json['long_description'] as String,
      street: json['street'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Monuments> parseMonuments(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Monuments>((json) => Monuments.fromJson(json)).toList();
}
