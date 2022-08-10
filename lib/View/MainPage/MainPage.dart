import 'package:flutter/material.dart';
import 'package:travelon/View/CarouselView/CarouselView.dart';
import 'package:travelon/View/CityMap/CityMap.dart';
import 'package:travelon/View/OtherOptions/OtherOptions.dart';
import '../MiniGame/MiniGame.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _onItemTapped(int index) {
    setState(() {
      _switchPage = index;
    });
  }

  var _switchPage = 0;

  _switchPageFunction() {
    switch (_switchPage) {
      case 0:
        return const _MainPageApp();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: _switchPageFunction(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: _switchPage,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'search',
          ),
        ],
      ),
    );
  }
}

class _MainPageApp extends StatelessWidget {
  const _MainPageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView(
              children: const [
                Text('witam'),
                Text('witam'),
                Text('witam'),
                Text('witam'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
