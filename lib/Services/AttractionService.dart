import 'package:http/http.dart' as http;
import 'package:travelon/Providers/ChangeText.dart';
import '../Models/CarouselViewModel/CarouselView.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<CarouselView>> fetchCarouselView() async {
  //pobranie strony WWW
  final response = await http.post(
    Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/carouselview.php'),
    body: {
      "type": returnType(),
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseCarouselView, response.body);
}

returnType() {
  switch (ChangeText().text) {
    case 'Gastronomia':
      return "Gastronomy";
    case 'Atrakcje':
      return "Attractions";
    case 'Produkty lokalne':
      return 'LocalProducts';
  }
}
