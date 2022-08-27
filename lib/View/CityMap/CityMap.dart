import 'package:flutter/material.dart';
import 'package:travelon/View/CityMap/GoogleMaps.dart';
import 'Button.dart';

class CityMap extends StatefulWidget {
  const CityMap({Key? key}) : super(key: key);

  @override
  State<CityMap> createState() => _CityMap();
}

class _CityMap extends State<CityMap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: const GoogleMaps(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 690, left: 70),
                child: Row(
                  children: [
                    ButtonFilter(
                      icon: "favourite",
                    ),
                    ButtonFilter(
                      icon: 'restaurant',
                    ),
                    ButtonFilter(
                      icon: 'coffee',
                    ),
                    ButtonFilter(
                      icon: 'ancient',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
