import 'dart:ui';

import 'package:flutter/material.dart';

class CityMap extends StatefulWidget {
  const CityMap({Key? key}) : super(key: key);

  @override
  State<CityMap> createState() => _CityMap();
}

class _CityMap extends State<CityMap> {
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).viewPadding;

    return Column(
      children: [
        Container(
          padding: topPadding,
          child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/POL_Przemyśl_COA.svg/1200px-POL_Przemyśl_COA.svg.png',
              height: 100),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Image.network(
                'https://www.kawaselfier.pl/userdata/public/assets//184205844_317035316480682_671758859148729909_n.jpg'),
          ),
        ),
      ],
    );
  }
}
