//wykonywane najpierw
import 'package:travelon/Services/AttractionService.dart';

class IndividualPage {
  final String id;
  final String name;
  final String description;
  final String elections;
  final String length;

  const IndividualPage({
    required this.id,
    required this.name,
    required this.description,
    required this.elections,
    required this.length,
  });

  factory IndividualPage.fromJson(Map<String, dynamic> json) {
    return IndividualPage(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      elections: json['elections'] as String,
      length: json['length'] as String,
    );
  }
}

class Attractions {
  final String id;
  final String name;
  final String description;
  final String elections;

  const Attractions({
    required this.id,
    required this.name,
    required this.description,
    required this.elections,
  });

  factory Attractions.fromJson(Map<String, dynamic> json) {
    return Attractions(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      elections: json['elections'] as String,
    );
  }
}
