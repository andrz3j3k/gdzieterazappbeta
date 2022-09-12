//wykonywane najpierw
import 'dart:convert';

class MapData {
  final String id;
  final String name;

  final String x;
  final String y;

  const MapData({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
  });

  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      id: json['id'] as String,
      name: json['name'] as String,
      x: json['x'] as String,
      y: json['y'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<MapData> parseMapData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MapData>((json) => MapData.fromJson(json)).toList();
}
