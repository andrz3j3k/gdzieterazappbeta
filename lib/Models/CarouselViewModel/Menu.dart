import 'dart:convert';
import 'dart:io';

class MenuData {
  final int id;
  final String name;
  final String description;
  final String price;
  final String size;

  const MenuData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.size,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
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

class ExtendedMenuData {
  final int id;
  final String name;
  final String price;
  final String size;

  const ExtendedMenuData({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
  });

  factory ExtendedMenuData.fromJson(Map<String, dynamic> json) {
    return ExtendedMenuData(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      size: json['size'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<ExtendedMenuData> parseExtendedMenuData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<ExtendedMenuData>((json) => ExtendedMenuData.fromJson(json))
      .toList();
}
