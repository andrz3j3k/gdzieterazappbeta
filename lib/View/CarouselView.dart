import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselView();
}

MyCard myCard = MyCard();

class _CarouselView extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: myCard.listCard.length,
        itemBuilder: (context, index) {
          myCard.indexAmount = index;
          return widgetCard();
        },
      ),
    );
  }
}

class MyCard {
  int indexAmount = 0;
  var listCard = [
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
}

Widget widgetCard() {
  return Center(
    child: SizedBox(
      width: 350,
      height: 450,
      child: Card(
        color: Colors.black,
        child: Image.network(
          myCard.listCard[myCard.indexAmount],
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
