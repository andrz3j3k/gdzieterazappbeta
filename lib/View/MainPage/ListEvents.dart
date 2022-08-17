import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListEvents extends StatelessWidget {
  const ListEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MyEvents();
      },
    );
  }
}

class MyEvents extends StatelessWidget {
  const MyEvents({Key? key}) : super(key: key);
  final stylingtext = const TextStyle(fontSize: 20);
  final subtitlestyle = const TextStyle(fontSize: 10);
  final trailingstyle = const TextStyle(fontSize: 12);
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: SizedBox(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: Colors.black,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                    "https://e-turysta.pl/zdjecia/galeria-glowna/max/129/Pokoje-Goscinne-Jantar-W-Przemyslu-Przemysl-1297418.jpg",
                    fit: BoxFit.fill),
                Container(
                  margin: const EdgeInsets.only(top: 130),
                  alignment: Alignment.bottomCenter,
                  color: Colors.black54,
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: const EdgeInsets.only(left: 25),
                    minLeadingWidth: 10,
                    textColor: Colors.white,
                    title: Text(
                      "Święto Fajek",
                      style: stylingtext,
                    ),
                    subtitle: Text(
                      "ul. Jagiellońska 21",
                      style: subtitlestyle,
                    ),
                    leading: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Icon(
                        Icons.explore_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    trailing: Container(
                      margin: const EdgeInsets.only(right: 25, top: 20),
                      child: Text(
                        "08.08.2022, 16:00",
                        style: trailingstyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
