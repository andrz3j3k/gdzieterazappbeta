import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:provider/provider.dart';
import 'package:travelon/View/MainPage/Providers.dart';

class ListAttraction extends StatelessWidget {
  const ListAttraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<ChangeText>().text == "Restauracje") {
      list = favouriteListRestaurant;
      return const ListElements();
    } else if (context.watch<ChangeText>().text == "Zabytki") {
      list = favouriteListMonuments;
      return const ListElements();
    } else {
      return const ListElements();
    }
  }
}

class ListElements extends StatelessWidget {
  const ListElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
