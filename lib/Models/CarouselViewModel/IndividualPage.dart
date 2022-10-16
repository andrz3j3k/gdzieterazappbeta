//wykonywane najpierw

class IndividualPage {
  final int id;
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
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      view_page: json['viewPage'] as String,
      number_of_photos: json['numberOfPhotos'] as String,
    );
  }
}
