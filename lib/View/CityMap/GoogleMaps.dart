import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelon/Models/CityMapModel/CurrentLocation.dart';
import 'package:travelon/Models/CityMapModel/GoogleMapsApi.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late GoogleMapController _googleMapController;
  late String mt;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      rootBundle.loadString('assets/style/googleMapsStyle.txt').then((string) {
        mt = string;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            markers: getMarker(),
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            rotateGesturesEnabled: false,
            initialCameraPosition: initialCameraPositionPrzemysl,
            onMapCreated: (controller) {
              _googleMapController = controller;
              _googleMapController.setMapStyle(mt);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ButtonFilter(
              //   icon: "favourite",
              // ),
              // ButtonFilter(
              //   icon: 'restaurant',
              // ),
              // ButtonFilter(
              //   icon: 'coffee',
              // ),
              // ButtonFilter(
              //   icon: 'ancient',
              // ),
              MaterialButton(
                onPressed: () async {
                  Position position = await currentPosition();
                  _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(position.latitude, position.longitude),
                          zoom: 14),
                    ),
                  );
                  markers.remove('current location');
                  markers.add(
                    Marker(
                      markerId: const MarkerId('current location'),
                      position: LatLng(position.latitude, position.longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(100),
                    ),
                  );
                  setState(() {});
                },
                color: Colors.white,
                textColor: const Color.fromARGB(255, 232, 171, 66),
                padding: const EdgeInsets.all(10),
                shape: const CircleBorder(),
                minWidth: 1,
                child: const Icon(
                  Icons.explore,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
