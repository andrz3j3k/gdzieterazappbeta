import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const initialCameraPositionPrzemysl = CameraPosition(
    target: LatLng(49.78399107263073, 22.76809200528949), zoom: 13);

Set<Marker> markers = {};
var listLocation;
getMarker() {
  markers.clear();
  for (int i = 0; i < listLocation.length; i++) {
    markers.add(
      Marker(
        markerId: const MarkerId('object'),
        position: LatLng(
            double.parse(listLocation[i].x), double.parse(listLocation[i].y)),
        icon: BitmapDescriptor.defaultMarkerWithHue(10),
        infoWindow: InfoWindow(
          title: listLocation[i].name,
        ),
      ),
    );
  }
  return markers;
}
