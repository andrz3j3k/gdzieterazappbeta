import 'package:flutter/material.dart';
import 'ObjectAfterClick.dart';
import 'package:travelon/Models/CarouselViewModel/CarouselViewModel.dart';

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
        return widgetCard(context);
      },
    );
  }
}

Widget widgetCard(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 350,
      height: 450,
      child: Card(
          color: Colors.black,
          child: GestureDetector(
            child: Image.network(
              MyCard.listCard[MyCard.indexAmount],
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ObjectAfterClick(
                          name: MyCard.listName[MyCard.indexAmount])));
            },
          )),
    ),
  );
}
