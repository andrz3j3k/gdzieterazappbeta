import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:travelon/Services/MenuService.dart';

import '../../ScaffoldStyle.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key, required this.list});
  var list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Material(
            elevation: 7,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: Stack(
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image.network(
                      "https://ajlrimlsmg.cfolks.pl/Objects/Background/${"${list.name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                      errorBuilder: (context, url, error) => const Icon(
                        Icons.image_not_supported_outlined,
                        size: 40,
                      ),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 55),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: whatIsDarkMode
                          ? backgroundColorButtonDark
                          : Colors.white,
                      padding: const EdgeInsets.all(8),
                      shape: const CircleBorder(),
                      minWidth: 1,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: whatIsDarkMode
                            ? universalColor
                            : themeLight.primaryColor,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.25, 0.5, 0.75, 1],
                      colors: whatIsDarkMode
                          ? [
                              themeDark.primaryColor.withAlpha(250),
                              themeDark.primaryColor.withAlpha(180),
                              themeDark.primaryColor.withAlpha(50),
                              Colors.transparent
                            ]
                          : [
                              themeLight.primaryColor.withAlpha(250),
                              themeLight.primaryColor.withAlpha(180),
                              themeLight.primaryColor.withAlpha(50),
                              Colors.transparent
                            ],
                    )),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45, bottom: 10),
                        child: Text(
                          list.name,
                          style: TextStyle(
                              color: whatIsDarkMode
                                  ? universalColor
                                  : Colors.white,
                              fontSize: 26),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: ListBody(
              children: [
                choiceOption(list.elections, list, 0, context),
                choiceOption(list.elections, list, 1, context),
                choiceOption(list.elections, list, 2, context),
                choiceOption(list.elections, list, 3, context),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

choiceOption(elections, list, index, context) {
  List<Widget> listWidget = [];
  for (int i = 0; i < 4; i++) {
    switch (elections[i]) {
      case '1':
        listWidget.add(Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: MyText(list: list)));
        break;
      case '2':
        listWidget.add(Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: MyPhoto(list: list)));
        break;
      case '3':
        listWidget.add(Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: MediaQuery.of(context).size.height * 0.5,
            child: MyMenu(id: list.id)));
        break;
      case '4':
        listWidget.add(Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 300,
            child: CarouselPhoto(
              name: list.name,
              length: list.length,
            )));
        break;
      case '0':
        break;
    }
  }
  if (index >= listWidget.length) {
    return Container();
  } else {
    return listWidget.elementAt(index);
  }
}

class MyText extends StatelessWidget {
  MyText({super.key, required this.list});
  var list;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
      child: Text(list.description),
    );
  }
}

class MyPhoto extends StatelessWidget {
  MyPhoto({super.key, required this.list});
  var list;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.7,
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: PinchZoom(
            maxScale: 2.0,
            child: SizedBox.fromSize(
              child: Image.network(
                "https://ajlrimlsmg.cfolks.pl/Objects/PhotoPageObject/${"${list.name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                errorBuilder: (context, url, error) =>
                    const Icon(Icons.image_not_supported_outlined, size: 40),
                // errorBuilder: (context, error, stackTrace) =>
                //     const Icon(Icons.image_not_supported_outlined, size: 40),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({super.key, required this.id});
  String id;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMenuData(id),
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
          var data = snapshot.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    if (int.parse(data[index].count) != 1) {
                      showModalBottomSheet(
                        context: context,
                        barrierColor: Colors.transparent,
                        backgroundColor: whatIsDarkMode
                            ? themeDark.scaffoldBackgroundColor
                            : Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              color: whatIsDarkMode
                                  ? themeDark.scaffoldBackgroundColor
                                  : Colors.white,
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Center(
                                    child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: int.parse(data[index].count),
                                  itemBuilder: (context, index2) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        color: whatIsDarkMode
                                            ? themeDark.primaryColor
                                            : themeLight.primaryColor,
                                        child: ListTile(
                                          title: Text(
                                            data[index].name,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          subtitle: Text(
                                            'Rozmiar: ${returnSize(data, index, int.parse(data[index2].count))}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          trailing: Text(
                                            returnPrice(data, index,
                                                int.parse(data[index2].count)),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Card(
                    color: whatIsDarkMode
                        ? themeDark.primaryColor
                        : themeLight.primaryColor,
                    child: ListTile(
                      textColor: Colors.white,
                      trailing: int.parse(data[index].count) == 1
                          ? Text(
                              '${returnPrice(data, index, int.parse(data[index].count))} zł',
                            )
                          : const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                      title: Text(
                        data[index].name,
                        style: const TextStyle(fontSize: 17),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 5, right: 20, bottom: 5),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          data[index].description,
                          style: TextStyle(
                            color: whatIsDarkMode
                                ? darkColorText
                                : themeDark.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  returnPrice(list, index, count) {
    var listDatabase = list[index].price;
    List<String> listPrice;

    listPrice = listDatabase.split(';');
    if (count > listPrice.length || listPrice.first == "") {
      return "Brak";
    } else {
      return listPrice[count - 1];
    }
  }

  returnSize(list, index, count) {
    var listDatabase = list[index].size;
    List<String> listSize;

    listSize = listDatabase.split(';');
    if (count > listSize.length - 1 || listSize.first == "") {
      return "Brak";
    } else {
      return listSize[count - 1];
    }
  }
}

class CarouselPhoto extends StatelessWidget {
  CarouselPhoto({super.key, required this.name, required this.length});
  var name;
  var length;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: int.parse(length),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            width: 300,
            margin: EdgeInsets.only(right: 5, left: 5),
            child: Image.network(
              "https://ajlrimlsmg.cfolks.pl/Objects/PhotoCarouselPageObject/${"${name.toLowerCase().replaceAll(" ", "")}$index.jpeg"}",
              errorBuilder: (context, url, error) =>
                  const Icon(Icons.image_not_supported_outlined, size: 40),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
