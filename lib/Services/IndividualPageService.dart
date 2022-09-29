import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/IndividualPage.dart';

//to jest wykonywane na samym koncu

import 'AttractionService.dart';

Future fetchIndividualPageData(id) async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/pageobject.php'),
    body: {
      "nameBase": returnNameBase(),
      "idObject": id.toString(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  if (returnNameBase() == "Gastronomy" || returnNameBase() == "LocalProducts") {
    return IndividualPage.fromJson(jsonDecode(response.body));
  } else {
    return Attractions.fromJson(jsonDecode(response.body));
  }
}
