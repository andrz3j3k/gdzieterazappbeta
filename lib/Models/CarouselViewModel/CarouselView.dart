import 'dart:convert';

//wykonywane najpierw
class CarouselView {
  final String id;
  final String name;
  final String street;

  const CarouselView({
    required this.id,
    required this.name,
    required this.street,
  });

  factory CarouselView.fromJson(Map<String, dynamic> json) {
    return CarouselView(
      id: json['id'] as String,
      name: json['name'] as String,
      street: json['street'] as String,
    );
  }
}

//to jest wykonywane po classie
// A function that converts a response body into a List<Photo>.
List<CarouselView> parseCarouselView(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<CarouselView>((json) => CarouselView.fromJson(json))
      .toList();
}
