import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:provider/provider.dart';

import '../../Providers/ChangeText.dart';

class ListAttraction extends StatelessWidget {
  const ListAttraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<ChangeText>().text == "Restauracje") {
      list = favouriteListRestaurant;
      return ListElements();
    } else if (context.watch<ChangeText>().text == "Zabytki") {
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
      case 'Zabytki':
        {
          text1 = 'zabytków';
          text2 = 'zabytki';
          break;
        }
      case 'Kawiarnie':
        {
          text1 = 'kawiarni';
          text2 = 'kawiarnie';
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
                title: Text('Nie masz ulubionych $text1!',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: RichText(
                  text: TextSpan(
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
              return Card(
                color: const Color.fromARGB(255, 232, 171, 66),
                elevation: 0,
                child: SizedBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: list.isEmpty
                              ? Container(
                                  color: Colors.black54,
                                )
                              : Image.network(
                                  "https://www.polska.travel/images/pl-PL/glowne-miasta/przemysl/przemysl_rynek_1170.jpg",
                                  fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          list.isEmpty
                              ? (index + 1).toString()
                              : list.elementAt(index),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
