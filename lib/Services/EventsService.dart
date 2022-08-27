import 'package:http/http.dart' as http;
import 'package:travelon/Models/MainPageModel/Events.dart';
import '../Models/MainPageModel/Events.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<Events>> fetchEvents() async {
  //pobranie strony WWW
  final response = await http.get(Uri.parse('http://192.168.192.7/events.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}
