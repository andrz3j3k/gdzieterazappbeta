import 'package:http/http.dart' as http;
import 'package:travelon/Models/CarouselViewModel/Menu.dart';
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';

Future<List<MenuData>> fetchMenuData(id) async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse('https://gdzieterazapp.pl/api/menu/object/$id'),
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMenuData, response.body);
}

Future<List<ExtendedMenuData>> fetchExtendedMenuData(idObject, id) async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse(
        'https://gdzieterazapp.pl/api/menu/object/$idObject/extended/$id'),
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseExtendedMenuData, response.body);
}
