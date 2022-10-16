import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';
import '../../Services/EventsService.dart';

class PageEvents extends StatelessWidget {
  PageEvents({Key? key, required this.id}) : super(key: key);
  final String id;
  late var event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchPageEvents(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const NoConnectionInternet(),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        whatIsDarkMode
                            ? HexColor('373590')
                            : HexColor('E8AA42'),
                      ),
                    ),
                    child: const Icon(
                      Icons.home,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          event = snapshot.data;
          return PhotoAndText(
            event: event,
          );
        } else {
          return const Center(
            child: CircularProgressIndicatorCustom(),
          );
        }
      },
    ));
  }
}

class PhotoAndText extends StatelessWidget {
  const PhotoAndText({super.key, required this.event});
  final event;
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
                      "https://gdzieterazapp.pl/wojewodztwa/podkarpackie/przemyśl/events/background/${"${event.name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                      errorBuilder: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 40),
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
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 45, bottom: 10),
                        child: Text(
                          event.name,
                          style: TextStyle(
                            color: universalColor,
                            fontSize: 26,
                          ),
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
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                children: [
                  changePage(event),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

changePage(event) {
  List<Widget> list = [
    TextWidget(event: event),
    Photo(
      event: event,
    ),
  ];
  if (event.page == '2') {
    return Column(children: [list[0]]);
  } else if (event.page == '3') {
    return Column(children: [list[1]]);
  } else {
    return Column(children: [list[0], list[1]]);
  }
}

class TextWidget extends StatelessWidget {
  TextWidget({super.key, required this.event});
  var event;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
      child: Text(event.long_description),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({super.key, required this.event});
  final event;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.fromSize(
          child: Image.network(
            "https://gdzieterazapp.pl/wojewodztwa/podkarpackie/przemyśl/events/poster/${"${event.name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
            errorBuilder: (context, url, error) =>
                const Icon(Icons.image_not_supported_outlined, size: 40),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
