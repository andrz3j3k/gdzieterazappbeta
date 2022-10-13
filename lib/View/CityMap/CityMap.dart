import 'package:flutter/material.dart';
import 'package:travelon/Services/MapDataService.dart';
import 'package:travelon/View/CityMap/GoogleMaps.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';

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
          return const Center(
            child: NoConnectionInternet(),
          );
        } else if (snapshot.hasData) {
          listLocation = snapshot.data;

          return const GoogleMaps();
        } else {
          return const Center(
            child: CircularProgressIndicatorCustom(),
          );
        }
      },
    );
  }
}
