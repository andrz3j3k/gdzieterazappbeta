import 'package:http/http.dart' as http;
import 'package:travelon/Models/MainPageModel/Events.dart';
import '../Models/MainPageModel/Events.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<Events>> fetchEvents() async {
  //pobranie strony WWW
  final response =
      await http.get(Uri.parse('https://ajlrimlsmg.cfolks.pl/events.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}
