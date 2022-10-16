import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/IndividualPage.dart';

//to jest wykonywane na samym koncu

import 'AttractionService.dart';

Future<IndividualPage> fetchIndividualPageData(id) async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse('https://gdzieterazapp.pl/api/objects/$id/type/${returnType()}'),
  );

  // // Use the compute function to run parsePhotos in a separate isolate.
  // if (returnType() == "Gastronomy" || returnType() == "LocalProducts") {
  // return IndividualPage.fromJson(jsonDecode(response.body));
  // } else {
  //   return Attractions.fromJson(jsonDecode(response.body));
  // }
  return IndividualPage.fromJson(jsonDecode(response.body));
}
