import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const initialCameraPositionPrzemysl = CameraPosition(
    target: LatLng(49.78399107263073, 22.76809200528949), zoom: 13);

Set<Marker> markers = {};
var listLocation;
getMarker() {
  for (int i = 0; i < listLocation.length; i++) {
    markers.add(
      Marker(
        markerId: const MarkerId('object'),
        position: LatLng(double.parse(listLocation[i]['x']),
            double.parse(listLocation[i]['y'])),
        icon: BitmapDescriptor.defaultMarkerWithHue(10),
        infoWindow: InfoWindow(
          title: listLocation[i]['name'],
          snippet: listLocation[i]['description'],
        ),
      ),
    );
  }
  return markers;
}

getData() async {
  var response = await http
      .get(Uri.parse('https://ajlrimlsmg.cfolks.pl/allAttraction.php'));
  var jsondecode = jsonDecode(response.body);
  return jsondecode;
}
