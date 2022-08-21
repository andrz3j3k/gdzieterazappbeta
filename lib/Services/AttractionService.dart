import 'package:http/http.dart' as http;
import '../Models/CarouselViewModel/Attraction.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<Attraction>> fetchAttraction() async {
  //pobranie strony WWW
  final response = await http.get(Uri.parse('http://localhost/restaurant.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}
