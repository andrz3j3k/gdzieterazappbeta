//wykonywane najpierw

class IndividualPage {
  final String id;
  final String name;
  final String description;
  final String view_page;
  final String number_of_photos;

  const IndividualPage({
    required this.id,
    required this.name,
    required this.description,
    required this.view_page,
    required this.number_of_photos,
  });

  factory IndividualPage.fromJson(Map<String, dynamic> json) {
    return IndividualPage(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      view_page: json['view_page'] as String,
      number_of_photos: json['number_of_photos'] as String,
    );
  }
}
