import 'dart:convert';

//wykonywane najpierw
class CarouselView {
  final String id;
  final String idobject;
  final String name;
  final String street;
  final String numberPhone;
  final String www;
  final String time;

  const CarouselView({
    required this.idobject,
    required this.id,
    required this.name,
    required this.street,
    required this.numberPhone,
    required this.www,
    required this.time,
  });

  factory CarouselView.fromJson(Map<String, dynamic> json) {
    return CarouselView(
      idobject: json['idobject'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      street: json['street'] as String,
      numberPhone: json['numberPhone'] as String,
      www: json['www'] as String,
      time: json['time'] as String,
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
