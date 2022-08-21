import 'dart:convert';

//wykonywane najpierw
class Events {
  final String id;
  final String name;
  final String description;
  final String street;
  final String date;
  final String time;

  const Events({
    required this.id,
    required this.name,
    required this.description,
    required this.street,
    required this.date,
    required this.time,
  });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      street: json['street'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Events> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Events>((json) => Events.fromJson(json)).toList();
}
