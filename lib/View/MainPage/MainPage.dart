import 'package:flutter/material.dart';
import 'package:travelon/View/CarouselView/CarouselView.dart';
import 'package:travelon/View/CityMap/CityMap.dart';
import 'package:travelon/View/MainPage/FavouritePlace.dart';
import 'package:travelon/View/OtherOptions/OtherOptions.dart';
import '../MiniGame/MiniGame.dart';
import 'ListAttraction.dart';
import 'ButtonSearch.dart';
import 'package:travelon/Models/MainModel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  _switchPageFunction() {
    switch (switchPage) {
      case 0:
        return const MainPageApp();
      case 1:
        return const MiniGame();
      case 2:
        return const CarouselView();
      case 3:
        return const CityMap();
      case 4:
        return const OtherOptions();
    }
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _onItemTapped(int index) {
    setState(() {
      switchPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._switchPageFunction(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: BottomNavigationBar(
            currentIndex: switchPage,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 232, 171, 66),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            selectedFontSize: 12,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_esports_outlined,
                  size: 30,
                ),
                label: "Nagrody",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  size: 30,
                ),
                label: "Szukaj",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_outlined,
                  size: 30,
                ),
                label: "Mapa",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
                label: "Ustawienia",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPageApp extends StatefulWidget {
  const MainPageApp({Key? key}) : super(key: key);

  static final List<String> kOptions = <String>[
    'Restauracje',
    'Zabytki',
    'Atrakcje',
  ];

  static const topMargin = EdgeInsets.only(top: 20);
  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                'Witaj w Travelon',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 232, 171, 66),
                ),
              ),
            ),
            const ButtonSearch(),
            const FavouritePlace(),
            Container(
              margin: MainPageApp.topMargin,
              color: const Color.fromARGB(255, 232, 171, 66),
              height: 150,
              child: const ListAttraction(),
            ),
          ],
        ),
      ),
    ]);
  }
}
