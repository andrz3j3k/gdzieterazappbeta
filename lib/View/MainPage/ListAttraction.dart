import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';

class ListAttraction extends StatefulWidget {
  const ListAttraction({Key? key}) : super(key: key);

  @override
  State<ListAttraction> createState() => _ListAttractionState();
}

class _ListAttractionState extends State<ListAttraction> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
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
                    child: Image.network(
                        "https://www.polska.travel/images/pl-PL/glowne-miasta/przemysl/przemysl_rynek_1170.jpg",
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    list[index].toString(),
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
