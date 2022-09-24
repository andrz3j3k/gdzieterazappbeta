import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/Menu.dart';
import '../Models/CarouselViewModel/CarouselView.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<MenuData>> fetchMenuData(id) async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/menudata.php'),
    body: {
      "id": id,
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMenuData, response.body);
}
