import 'package:flutter/material.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/View/CarouselView/CarouselView.dart';
import 'package:travelon/View/CityMap/CityMap.dart';
import 'package:travelon/View/MainPage/FavouritePlace.dart';
import 'package:travelon/View/MainPage/ListEvents.dart';
import 'package:travelon/View/OtherOptions/OtherOptions.dart';
import '../MiniGame/MiniGame.dart';
import 'ListAttractionFavourite.dart';
import 'ButtonSearch.dart';
import 'package:travelon/Models/MainModel.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: switchPage,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: const Color.fromARGB(255, 232, 171, 66),
          // selectedItemColor: Colors.white,
          // unselectedItemColor: Colors.white,
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
    );
  }
}

class MainPageApp extends StatefulWidget {
  const MainPageApp({Key? key}) : super(key: key);

  static const topMargin = EdgeInsets.only(top: 20);
  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).viewPadding;

    return Column(
      children: [
        Container(
          padding: topPadding,
          child: AutoSizeText(
            'Witaj w Trip & Travel',
            style: TextStyle(
              fontSize: 40,
              color: whatIsDarkMode ? titleTextColor : themeLight.primaryColor,
            ),
            minFontSize: 20,
            maxLines: 1,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: const ButtonSearch(),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: const FavouritePlace(),
        ),
        Container(
          height: 150,
          color:
              whatIsDarkMode ? themeDark.primaryColor : themeLight.primaryColor,
          child: const ListAttraction(),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Wydarzenia z: Przemyśl',
            style: TextStyle(
              fontSize: 20,
              color: whatIsDarkMode ? darkColorText : lightColorTextGrey,
            ),
          ),
        ),
        Expanded(
          child: Container(
            // height: screenheight / 2.288, //253 0.379
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: const ListEvents(),
          ),
        ),
      ],
    );
  }
}
