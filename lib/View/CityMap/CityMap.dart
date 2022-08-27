import 'package:flutter/material.dart';
import 'package:travelon/View/CityMap/GoogleMaps.dart';

class CityMap extends StatefulWidget {
  const CityMap({Key? key}) : super(key: key);

  @override
  State<CityMap> createState() => _CityMap();
}

class _CityMap extends State<CityMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: const GoogleMaps(),
    );
  }
}
