import 'dart:convert';

//wykonywane najpierw
class Regulations {
  final String id;
  final String tekst;

  const Regulations({
    required this.id,
    required this.tekst,
  });

  factory Regulations.fromJson(Map<String, dynamic> json) {
    return Regulations(
      id: json['id'] as String,
      tekst: json['tekst'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Regulations> parseRegulations(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Regulations>((json) => Regulations.fromJson(json)).toList();
}
