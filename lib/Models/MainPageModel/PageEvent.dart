//wykonywane najpierw
class PageEvents {
  final String id;
  final String name;
  final String long_description;

  const PageEvents({
    required this.id,
    required this.name,
    required this.long_description,
  });

  factory PageEvents.fromJson(Map<String, dynamic> json) {
    return PageEvents(
      id: json['id'] as String,
      name: json['name'] as String,
      long_description: json['long_description'] as String,
    );
  }
}
