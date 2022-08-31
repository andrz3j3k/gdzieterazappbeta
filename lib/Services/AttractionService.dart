import 'package:http/http.dart' as http;
import '../Models/CarouselViewModel/Attraction.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<Attraction>> fetchAttraction() async {
  //pobranie strony WWW
  final response =
      await http.get(Uri.parse('https://ajlrimlsmg.cfolks.pl/restaurant.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseAttraction, response.body);
}
