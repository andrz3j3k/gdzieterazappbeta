import 'package:flutter/material.dart';
import 'package:travelon/Models/CarouselViewModel/Attraction.dart';
import 'ObjectAfterClick.dart';
import 'package:travelon/Models/CarouselViewModel/CarouselViewModel.dart';
import '../../Services/AttractionService.dart';
import 'ButtonFavourite.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselView();
}

class _CarouselView extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Attraction>>(
      future: fetchAttraction(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Błąd w trakcie wczytywania danych!'),
          );
        } else if (snapshot.hasData) {
          return PageViewBuilder(list: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({Key? key, required this.list}) : super(key: key);
  final List<Attraction> list;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        MyCard.indexAmount = index;
        return WidgetCard(
          list: list,
          index: index,
        );
      },
    );
  }
}

class WidgetCard extends StatelessWidget {
  const WidgetCard({Key? key, required this.list, required this.index})
      : super(key: key);

  final int index;
  final List<Attraction> list;

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
              child: ListTile(
                title: Text(
                  list[index].name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                subtitle: Text(list[index].street),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 15, right: 20),
              child: FavouriteButton(
                icon: "favourite",
                list: list,
                index: index,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
