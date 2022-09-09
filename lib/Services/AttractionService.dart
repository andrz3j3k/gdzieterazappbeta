import 'package:http/http.dart' as http;
import 'package:travelon/Providers/ChangeText.dart';
import '../Models/CarouselViewModel/Attraction.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<Attraction>> fetchAttraction() async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/carouselview.php'),
    body: {
      "nameBase": returnNameBase(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseAttraction, response.body);
}

returnNameBase() {
  switch (ChangeText().text) {
    case 'Restauracje':
      return "Restaurant";
    case 'Zabytki':
      return "Monuments";
  }
}
