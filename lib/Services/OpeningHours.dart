import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/OpeningHours.dart';

Future<OpeningHours> fetchOpeningHours(id) async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse('https://gdzieterazapp.pl/api/opening-house/$id'),
  );
  return OpeningHours.fromJson(jsonDecode(response.body));
}
