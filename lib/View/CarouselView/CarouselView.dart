import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/Services/AttractionService.dart';
import 'ObjectAfterClick.dart';
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
      function: fetchCarouselView(),
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.wifi_off,
                  size: 40,
                ),
                Text('Brak połączenia z internetem'),
              ],
            ),
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
          width: double.infinity,
          padding:
              topPadding + const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: Image.network(
                "https://ajlrimlsmg.cfolks.pl/Objects/CarouselView/${"${list[index].name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                errorBuilder: (context, url, error) =>
                    const Icon(Icons.image_not_supported_outlined, size: 40),
                // errorBuilder: (context, error, stackTrace) =>
                //     const Icon(Icons.image_not_supported_outlined, size: 40),
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ObjectAfterClick(
                    id: list[index].idobject,
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
                title: AutoSizeText(
                  list[index].name,
                  minFontSize: 20.0,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whatIsDarkMode ? universalColor : textBlack),
                ),
                subtitle: Text(
                  'ul. ${list[index].street}',
                  style: TextStyle(
                    color: textBlack2,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            returnButtonTel(),
            returnButtonWeb(),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(top: 5, right: 10),
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

  returnButtonWeb() {
    if (list[index].www != "") {
      return Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.only(top: 5, right: 10),
        child: FavouriteButton(
          icon: "web",
          list: list,
          index: index,
        ),
      );
    } else {
      return const Text('');
    }
  }

  returnButtonTel() {
    if (list[index].numberPhone != "") {
      return Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.only(top: 5, right: 10),
        child: FavouriteButton(
          icon: "phone",
          list: list,
          index: index,
        ),
      );
    } else {
      return const Text('');
    }
  }
}
