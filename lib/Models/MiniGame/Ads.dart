import 'dart:convert';

//wykonywane najpierw
class Ads {
  final int id;
  final String name;

  const Ads({
    required this.id,
    required this.name,
  });

  factory Ads.fromJson(Map<String, dynamic> json) {
    return Ads(
      id: json['object_id'] as int,
      name: json['name'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<Ads> parseAds(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Ads>((json) => Ads.fromJson(json)).toList();
}
