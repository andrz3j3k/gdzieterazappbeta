import 'package:http/http.dart' as http;
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';
import 'package:travelon/Services/AttractionService.dart';
import '../Models/MiniGame/Ads.dart';

Future<List<Ads>> fetchAds() async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/adspage.php'),
    body: {
      "type": returnType(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseAds, response.body);
}
