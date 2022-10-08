import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/MainPageModel/MainPageEvents.dart';
import 'package:flutter/foundation.dart';
import '../Models/MainPageModel/PageEvent.dart';

Future<List<MainPageEvents>> fetchMainPageEvents() async {
  //pobranie strony WWW
  final response = await http.get(
      Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/mainpageevents.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMainPageEvents, response.body);
}

Future<PageEvents> fetchPageEvents(id) async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/pageevent.php'),
    body: {
      "idEvents": id.toString(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return PageEvents.fromJson(jsonDecode(response.body));
}
