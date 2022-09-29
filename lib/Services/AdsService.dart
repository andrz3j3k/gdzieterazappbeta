import 'package:http/http.dart' as http;
import 'package:travelon/Providers/ChangeText.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';
import 'package:travelon/Services/AttractionService.dart';
import '../Models/MiniGame/Ads.dart';

Future<List<Ads>> fetchAds() async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/adspage.php'),
    body: {
      "nameBase": returnNameBase(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseAds, response.body);
}

// returnNameBase() {
//   switch (ChangeText().text) {
//     case 'Gastronomia':
//       return "Gastronomy";
//   }
// }
