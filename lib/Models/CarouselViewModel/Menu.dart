import 'dart:convert';

class MenuData {
  final String id;
  final String name;
  final String description;
  final String price;
  final String count;
  final String size;

  const MenuData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    required this.size,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      count: json['count'] as String,
      size: json['size'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<MenuData> parseMenuData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MenuData>((json) => MenuData.fromJson(json)).toList();
}
