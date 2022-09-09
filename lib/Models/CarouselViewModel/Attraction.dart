import 'dart:convert';

//wykonywane najpierw
class Attraction {
  final String id;
  final String name;
  final String street;

  const Attraction({
    required this.id,
    required this.name,
    required this.street,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'] as String,
      name: json['name'] as String,
      street: json['street'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Attraction> parseAttraction(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Attraction>((json) => Attraction.fromJson(json)).toList();
}
