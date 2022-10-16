//wykonywane najpierw
class MainText {
  final int id;
  final String name;
  final String text;

  const MainText({
    required this.id,
    required this.name,
    required this.text,
  });

  factory MainText.fromJson(Map<String, dynamic> json) {
    return MainText(
      id: json['id'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
    );
  }
}
