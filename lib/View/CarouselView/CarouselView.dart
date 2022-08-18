import 'package:flutter/material.dart';
import 'ObjectAfterClick.dart';
import 'package:travelon/Models/CarouselViewModel/CarouselViewModel.dart';
import '../CityMap/Button.dart';

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
        return const WidgetCard();
      },
    );
  }
}

class WidgetCard extends StatelessWidget {
  const WidgetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).viewPadding;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding:
              topPadding + const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: Image.network(
                MyCard.listCard[MyCard.indexAmount],
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ObjectAfterClick(
                    name: MyCard.listName[MyCard.indexAmount],
                  ),
                ),
              );
            },
          ),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: const ListTile(
                title: Text(
                  'Cuda Wianki',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                subtitle: Text(
                  "Przemyśl, ul. Rynek 5",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 15, right: 20),
              child: ButtonFilter(
                icon: "favourite",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
