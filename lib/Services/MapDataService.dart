import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/MapData.dart';

import 'AttractionService.dart';

//to jest wykonywane na samym koncu

Future<List<MapData>> fetchMapaData() async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/mapdata.php'),
    body: {
      "type": returnType(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMapData, response.body);
}
