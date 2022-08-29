import 'package:flutter/material.dart';
import 'package:travelon/ScaffoldStyle.dart';

class ObjectAfterClick extends StatelessWidget {
  const ObjectAfterClick(
      {Key? key, required this.name, required this.description})
      : super(key: key);

  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              elevation: 7,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      child: Image.network(
                        'https://www.alejahandlowa.pl/wp-content/uploads/wloskie-jedzenie-847x570.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, left: 20),
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
                      height: 150,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 50),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35, top: 105),
                        child: Text(
                          name,
                          style: TextStyle(
                              color: whatIsDarkMode
                                  ? universalColor
                                  : Colors.white,
                              fontSize: 26),
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
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Text(description),
                  ),
                  InteractiveViewer(
                    panEnabled: false,
                    boundaryMargin: const EdgeInsets.all(100),
                    minScale: 1,
                    maxScale: 2,
                    child: Image.network(
                      'https://www.farfalla.com.pl/_Resources/Persistent/014012658de4a690fd5f81ce364481a4f59596ed/karta%20lipiec%202021%20str%201.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
