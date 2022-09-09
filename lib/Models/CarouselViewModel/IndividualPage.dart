//wykonywane najpierw
class IndividualPage {
  final String id;
  final String name;
  final String long_description;

  const IndividualPage({
    required this.id,
    required this.name,
    required this.long_description,
  });

  factory IndividualPage.fromJson(Map<String, dynamic> json) {
    return IndividualPage(
      id: json['id'] as String,
      name: json['name'] as String,
      long_description: json['long_description'] as String,
    );
  }
}
