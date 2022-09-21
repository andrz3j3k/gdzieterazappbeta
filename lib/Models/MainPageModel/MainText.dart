//wykonywane najpierw
class MainText {
  final String id;
  final String text;

  const MainText({
    required this.id,
    required this.text,
  });

  factory MainText.fromJson(Map<String, dynamic> json) {
    return MainText(
      id: json['id'] as String,
      text: json['text'] as String,
    );
  }
}
