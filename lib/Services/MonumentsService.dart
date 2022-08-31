import 'package:http/http.dart' as http;
import '../Models/CarouselViewModel/Monuments.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<Monuments>> fetchMonuments() async {
  //pobranie strony WWW
  final response =
      await http.get(Uri.parse('https://ajlrimlsmg.cfolks.pl/monuments.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMonuments, response.body);
}
