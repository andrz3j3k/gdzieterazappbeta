import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
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
        Container(
          padding: const EdgeInsets.only(bottom: 60),
          child: Image.network(
              'https://www.kawaselfier.pl/userdata/public/assets//184205844_317035316480682_671758859148729909_n.jpg'),
        ),
        Container(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Filtruj: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
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
    );
  }
}
