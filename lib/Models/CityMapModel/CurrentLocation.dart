import 'package:geolocator/geolocator.dart';

Future<Position> currentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error('Lokalizacja została wyłączona!');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Brak pozwolenia na lokalizacje');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Pozwolenie na lokalizacje zostało na zawsze wyłączone');
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}
