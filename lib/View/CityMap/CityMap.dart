import 'dart:async';

import 'package:flutter/material.dart';
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
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Błąd w trakcie wczytywania danych!'),
          );
        } else if (snapshot.hasData) {
          listLocation = snapshot.data;
          Timer(
            const Duration(seconds: 1),
            () => getMarker(),
          );
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
