//wykonywane najpierw
class IndividualPage {
  final String id;
  final String name;
  final String description;
  final String elections;
  final String length;
  final String id_view_menu;

  const IndividualPage({
    required this.id,
    required this.name,
    required this.description,
    required this.elections,
    required this.length,
    required this.id_view_menu,
  });

  factory IndividualPage.fromJson(Map<String, dynamic> json) {
    return IndividualPage(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      elections: json['elections'] as String,
      length: json['length'] as String,
      id_view_menu: json['id_view_menu'] as String,
    );
  }
}
