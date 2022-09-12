import 'package:flutter/material.dart';
import 'package:travelon/Services/MapDataService.dart';
import 'package:travelon/View/CityMap/GoogleMaps.dart';

import '../../Models/CityMapModel/GoogleMapsApi.dart';

class CityMap extends StatefulWidget {
  const CityMap({Key? key}) : super(key: key);

  @override
  State<CityMap> createState() => _CityMap();
}

class _CityMap extends State<CityMap> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMapaData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.wifi_off,
                  size: 40,
                ),
                Text('Brak połączenia z internetem'),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          listLocation = snapshot.data;

          return const GoogleMaps();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
