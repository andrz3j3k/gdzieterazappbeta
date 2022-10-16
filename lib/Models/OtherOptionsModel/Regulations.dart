import 'dart:convert';

//wykonywane najpierw
class Regulations {
  final int id;
  final String text;

  const Regulations({
    required this.id,
    required this.text,
  });

  factory Regulations.fromJson(Map<String, dynamic> json) {
    return Regulations(
      id: json['id'] as int,
      text: json['text'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Regulations> parseRegulations(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Regulations>((json) => Regulations.fromJson(json)).toList();
}
