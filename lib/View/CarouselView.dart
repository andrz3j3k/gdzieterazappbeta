import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselView();
}

class _CarouselView extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: MyCard.listCard.length,
      itemBuilder: (context, index) {
        MyCard.indexAmount = index;
        return widgetCard();
      },
    );
  }
}

class MyCard {
  static var listCard = [
    'https://nadzory-archeologiczne.pl/wp-content/uploads/2018/03/Przemyśl-panorama-z-wieży-archikatedry.jpg',
    'https://nadzory-archeologiczne.pl/wp-content/uploads/2018/03/Przemyśl-panorama-z-wieży-archikatedry.jpg',
    'https://nadzory-archeologiczne.pl/wp-content/uploads/2018/03/Przemyśl-panorama-z-wieży-archikatedry.jpg',
    'https://www.polska.travel/images/pl-PL/glowne-miasta/przemysl/przemysl_rynek_1170.jpg',
    'https://nadzory-archeologiczne.pl/wp-content/uploads/2018/03/Przemyśl-panorama-z-wieży-archikatedry.jpg',
    'https://www.polska.travel/images/pl-PL/glowne-miasta/przemysl/przemysl_rynek_1170.jpg',
    'https://nadzory-archeologiczne.pl/wp-content/uploads/2018/03/Przemyśl-panorama-z-wieży-archikatedry.jpg',
    'https://www.polska.travel/images/pl-PL/glowne-miasta/przemysl/przemysl_rynek_1170.jpg',
    'https://nadzory-archeologiczne.pl/wp-content/uploads/2018/03/Przemyśl-panorama-z-wieży-archikatedry.jpg',
    'https://www.polska.travel/images/pl-PL/glowne-miasta/przemysl/przemysl_rynek_1170.jpg',
  ];
  static int indexAmount = 0;
}

Widget widgetCard() {
  return Center(
    child: SizedBox(
      width: 350,
      height: 450,
      child: Card(
        color: Colors.black,
        child: Image.network(
          MyCard.listCard[MyCard.indexAmount],
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
