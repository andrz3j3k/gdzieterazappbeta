import 'package:flutter/material.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/Services/AttractionService.dart';
import 'ObjectAfterClick.dart';
import 'package:travelon/Models/CarouselViewModel/CarouselViewModel.dart';
import 'ButtonFavourite.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselView();
}

class _CarouselView extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilderView(
      function: fetchAttraction(),
    );
  }
}

class FutureBuilderView extends StatelessWidget {
  const FutureBuilderView({Key? key, required this.function}) : super(key: key);

  final function;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: function,
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
  final list;
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
  final list;

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
                    id: list[index].id,
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
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: whatIsDarkMode ? universalColor : textBlack),
                ),
                subtitle: Text(
                  'ul. ${list[index].street}',
                  style: TextStyle(color: textBlack2),
                ),
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
