import 'package:http/http.dart' as http;
//to jest wykonywane na samym koncu
import 'package:flutter/foundation.dart';
import 'package:travelon/Models/OtherOptionsModel/regulations.dart';

Future<List<Regulations>> fetchRegulations() async {
  //pobranie strony WWW
  final response = await http.get(
    Uri.parse('https://gdzieterazapp.pl/api/regulations'),
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseRegulations, response.body);
}
