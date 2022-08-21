import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/Events.dart';
import 'package:travelon/Services/EventsService.dart';

class ListEvents extends StatelessWidget {
  const ListEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Events>>(
      future: fetchEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Błąd w trakcie wczytywania wydarzeń!'),
          );
        } else if (snapshot.hasData) {
          return MyEventsBuilder(list: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MyEventsBuilder extends StatelessWidget {
  const MyEventsBuilder({Key? key, required this.list}) : super(key: key);
  final List<Events> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
  final List<Events> list;
  final int index;
  final stylingtext = const TextStyle(fontSize: 20);
  final subtitlestyle = const TextStyle(fontSize: 10);
  final trailingstyle = const TextStyle(fontSize: 12);
  @override
  Widget build(BuildContext context) {
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
              children: list.isNotEmpty
                  ? [
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
                            list[index].name,
                            style: stylingtext,
                          ),
                          subtitle: Text(
                            "ul. ${list[index].street}",
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
                              "${list[index].date}, ${list[index].time}",
                              style: trailingstyle,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [
                      Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text("Aktualnie brak wydarzeń!")),
                      )
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
