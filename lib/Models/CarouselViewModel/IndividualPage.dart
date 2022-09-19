//wykonywane najpierw
class IndividualPage {
  final String id;
  final String name;
  final String description;

  const IndividualPage({
    required this.id,
    required this.name,
    required this.description,
  });

  factory IndividualPage.fromJson(Map<String, dynamic> json) {
    return IndividualPage(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
