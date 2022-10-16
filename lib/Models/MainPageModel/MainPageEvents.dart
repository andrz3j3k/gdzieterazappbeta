import 'dart:convert';

//wykonywane najpierw
class MainPageEvents {
  final int id;
  final String name;
  final String street;
  final String date;
  final String time;

  const MainPageEvents({
    required this.id,
    required this.name,
    required this.street,
    required this.date,
    required this.time,
  });

  factory MainPageEvents.fromJson(Map<String, dynamic> json) {
    return MainPageEvents(
      id: json['id'] as int,
      name: json['name'] as String,
      street: json['street'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<MainPageEvents> parseMainPageEvents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<MainPageEvents>((json) => MainPageEvents.fromJson(json))
      .toList();
}
