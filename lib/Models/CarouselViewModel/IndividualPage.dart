//wykonywane najpierw
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
