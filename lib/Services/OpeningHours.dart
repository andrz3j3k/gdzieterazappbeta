import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/OpeningHours.dart';

Future<OpeningHours> fetchOpeningHours(id) async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/openinghours.php'),
    body: {
      "idObject": id.toString(),
    },
  );
  return OpeningHours.fromJson(jsonDecode(response.body));
}
