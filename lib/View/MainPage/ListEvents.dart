import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Services/EventsService.dart';
import 'package:travelon/View/MainPage/PageEvents.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';

import '../../Models/MainPageModel/MainPageEvents.dart';

class ListEvents extends StatelessWidget {
  const ListEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MainPageEvents>>(
      future: fetchMainPageEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: NoConnectionInternet());
        } else if (snapshot.hasData) {
          return MyEventsBuilder(list: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicatorCustom(),
          );
        }
      },
    );
  }
}

class MyEventsBuilder extends StatelessWidget {
  const MyEventsBuilder({Key? key, required this.list}) : super(key: key);
  final List<MainPageEvents> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: list.isEmpty ? 1 : list.length,
      itemBuilder: (context, index) {
        return MyEvents(list: list, index: index);
      },
    );
  }
}

class MyEvents extends StatelessWidget {
  const MyEvents({Key? key, required this.list, required this.index})
      : super(key: key);
  final List<MainPageEvents> list;
  final int index;
  final stylingtext = const TextStyle(fontSize: 20);
  final subtitlestyle = const TextStyle(fontSize: 10);
  final trailingstyle = const TextStyle(fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            if (list.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageEvents(
                    id: (list[index].id.toString()),
                  ),
                ),
              );
            }
          },
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
                children: list.isNotEmpty
                    ? [
                        Image.network(
                          "https://gdzieterazapp.pl/wojewodztwa/podkarpackie/przemyśl/events/background/${"${list[index].name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                          errorBuilder: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 40),
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.black54,
                            child: ListTile(
                              visualDensity: VisualDensity.comfortable,
                              contentPadding: const EdgeInsets.only(left: 25),
                              minLeadingWidth: 10,
                              textColor: universalColor,
                              title: AutoSizeText(
                                list[index].name,
                                style: stylingtext,
                                maxLines: 1,
                                minFontSize: 10,
                              ),
                              subtitle: AutoSizeText(
                                "ul. ${list[index].street}",
                                style: subtitlestyle,
                                minFontSize: 8,
                                maxLines: 1,
                              ),
                              leading: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Icon(
                                  Icons.explore_outlined,
                                  color: universalColor,
                                  size: 25,
                                ),
                              ),
                              trailing: Container(
                                margin:
                                    const EdgeInsets.only(right: 25, top: 20),
                                child: AutoSizeText(
                                  "${list[index].date}, ${list[index].time}",
                                  style: trailingstyle,
                                  maxLines: 1,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    : [
                        Container(
                          color: whatIsDarkMode
                              ? themeDark.primaryColor
                              : themeLight.primaryColor,
                          child: Center(
                            child: Text(
                              "Aktualnie brak wydarzeń!",
                              style: TextStyle(
                                color: whatIsDarkMode
                                    ? darkColorText
                                    : Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
