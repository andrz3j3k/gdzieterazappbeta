//wykonywane najpierw
class PageEvents {
  final int id;
  final String name;
  final String long_description;
  final String page;

  const PageEvents({
    required this.id,
    required this.name,
    required this.long_description,
    required this.page,
  });

  factory PageEvents.fromJson(Map<String, dynamic> json) {
    return PageEvents(
      id: json['id'] as int,
      name: json['name'] as String,
      long_description: json['long_description'] as String,
      page: json['page'] as String,
    );
  }
}
