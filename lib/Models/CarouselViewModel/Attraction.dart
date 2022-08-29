import 'dart:convert';

//wykonywane najpierw
class Attraction {
  final String id;
  final String name;
  final String description;
  final String long_description;
  final String street;
  final String numberPhone;

  const Attraction({
    required this.id,
    required this.name,
    required this.description,
    required this.long_description,
    required this.street,
    required this.numberPhone,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      long_description: json['long_description'] as String,
      street: json['street'] as String,
      numberPhone: json['numberPhone'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Attraction> parseAttraction(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Attraction>((json) => Attraction.fromJson(json)).toList();
}
