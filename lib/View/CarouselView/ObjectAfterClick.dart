import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:photo_view/photo_view.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/Services/IndividualPageService.dart';

class ObjectAfterClick extends StatelessWidget {
  const ObjectAfterClick({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchIndividualPageData(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wifi_off,
                    size: 40,
                  ),
                  const Text('Brak połączenia z internetem'),
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
            var list = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Material(
                    elevation: 7,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    child: Stack(
                      children: [
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                            child: Image.network(
                              "https://ajlrimlsmg.cfolks.pl/Objects/Background/${"${list.name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported_outlined,
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
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
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
                                padding:
                                    const EdgeInsets.only(left: 45, bottom: 10),
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
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                          child: Text(list.long_description),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          alignment: Alignment.center,
                          child: ClipRect(
                            child: PhotoView(
                              maxScale: 1.0,
                              backgroundDecoration: const BoxDecoration(
                                  color: Colors.transparent),
                              loadingBuilder: (context, event) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported_outlined,
                                      size: 40),
                              imageProvider: NetworkImage(
                                "https://ajlrimlsmg.cfolks.pl/Objects/Menu/${"${list.name.toLowerCase().replaceAll(" ", "")}.jpeg"}",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
