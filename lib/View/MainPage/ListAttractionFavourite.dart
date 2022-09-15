import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:provider/provider.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/Services/AttractionService.dart';
import '../../Providers/ChangeText.dart';
import '../CarouselView/ObjectAfterClick.dart';

class ListAttraction extends StatelessWidget {
  const ListAttraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<ChangeText>().text == "Restauracje") {
      list = favouriteListRestaurant;
      return ListElements();
    } else if (context.watch<ChangeText>().text == "Kawiarnie") {
      list = favouriteListMonuments;
      return ListElements();
    } else if (context.watch<ChangeText>().text == "Bary") {
      list = favouriteListMonuments;
      return ListElements();
    } else if (context.watch<ChangeText>().text == "Atrakcje") {
      list = favouriteListMonuments;
      return ListElements();
    } else if (context.watch<ChangeText>().text == "Produkty lokalne") {
      list = favouriteListMonuments;
      return ListElements();
    } else {
      return ListElements();
    }
  }
}

class ListElements extends StatelessWidget {
  ListElements({Key? key}) : super(key: key);
  ChangeText ct = ChangeText();
  late String text1;
  late String text2;
  returnValue() {
    switch (ct.text) {
      case 'Restauracje':
        {
          text1 = "restauracji";
          text2 = 'restauracje';
          break;
        }
      case 'Bary':
        {
          text1 = 'barów';
          text2 = 'bary';
          break;
        }
      case 'Kawiarnie':
        {
          text1 = 'kawiarni';
          text2 = 'kawiarnie';
          break;
        }
      case 'Atrakcje':
        {
          text1 = 'atrakcji';
          text2 = 'atrakcje';
          break;
        }
      case 'Produkty lokalne':
        {
          text1 = 'produktów lokalnych';
          text2 = 'produkty lokalne';
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    returnValue();
    return list.isEmpty
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Center(
              child: ListTile(
                title: AutoSizeText(
                  maxLines: 1,
                  'Nie masz ulubionych $text1!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: universalColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                    text: "Przejdź do ",
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Szukaj',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const TextSpan(
                        text: ' i kliknij ikonę',
                      ),
                      const TextSpan(
                        text: ' gwiazdki',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                          text:
                              ', aby dodać $text2 do Twojej listy ulubionych'),
                    ],
                  ),
                ),
              ),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.isEmpty ? 10 : list.length,
            itemBuilder: (context, index) {
              var listPage;
              return FutureBuilder(
                future: fetchCarouselView(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          child: const Icon(
                            Icons.wifi_off,
                            size: 30,
                          )),
                    );
                  } else if (snapshot.hasData) {
                    listPage = snapshot.data;
                    return Card(
                      color: whatIsDarkMode
                          ? themeDark.primaryColor
                          : themeLight.primaryColor,
                      elevation: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ObjectAfterClick(
                                // id: listPage[index].id,
                                id: returnId(list.elementAt(index), listPage),
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                      "https://ajlrimlsmg.cfolks.pl/Objects/Logo/${list.elementAt(index).toLowerCase().replaceAll(" ", "")}.jpeg",
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          const Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              size: 40),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: AutoSizeText(
                                  list.elementAt(index),
                                  minFontSize: 10,
                                  style: TextStyle(color: universalColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          );
  }
}

returnId(list, listPage) {
  int value = 0;
  for (int i = 0; i < listPage.length; i++) {
    if (list == listPage[i].name) {
      value = i;
    }
  }
  return listPage[value].id;
}
