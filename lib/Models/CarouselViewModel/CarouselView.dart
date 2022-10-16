import 'dart:convert';

//wykonywane najpierw
class CarouselView {
  final int idobject;
  final int id_position;
  final String name;
  final String street;
  final String type;
  final String numberPhone;
  final String www;

  const CarouselView({
    required this.idobject,
    required this.id_position,
    required this.name,
    required this.street,
    required this.numberPhone,
    required this.www,
    required this.type,
  });

  factory CarouselView.fromJson(Map<String, dynamic> json) {
    return CarouselView(
      idobject: json['idobject'] as int,
      id_position: json['id_position'] as int,
      name: json['name'] as String,
      street: json['street'] as String,
      numberPhone: json['numberPhone'] as String,
      www: json['www'] as String,
      type: json['type'] as String,
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
