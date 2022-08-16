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
        return const WidgetCard();
      },
    );
  }
}

class WidgetCard extends StatelessWidget {
  const WidgetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                child: SizedBox(
                  width: 332,
                  height: 470,
                  child: Container(
                    color: Colors.red,
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
                              name: MyCard.listName[MyCard.indexAmount],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: const ListTile(
                title: Text(
                  'Cuda Wianki',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                subtitle: Text("Przemyśl, ul. Rynek 5"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
