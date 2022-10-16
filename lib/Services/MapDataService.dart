import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/MapData.dart';

import 'AttractionService.dart';

//to jest wykonywane na samym koncu

Future<List<MapData>> fetchMapaData() async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse('https://gdzieterazapp.pl/api/map-data/${returnType()}'),
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMapData, response.body);
}
