import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'Models/MainPageModel/MainText.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({
    super.key,
    required this.text,
    required this.type,
  });
  String text;
  String type;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<MainText> fetchwww() async {
    //pobranie strony WWW
    final response = await http.get(
      Uri.parse('https://gdzieterazapp.pl/api/settings/upgrade'),
    );

    // Use the compute function to run parsePhotos in a separate isolate.
    return MainText.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.type == "Brak aktualizacji"
          ? FutureBuilder(
              future: fetchwww(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return NoConnectionInternet();
                } else if (snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.system_update,
                            size: 40,
                            color: whatIsDarkMode
                                ? darkColorText
                                : themeLight.primaryColor,
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            widget.text,
                            textAlign: TextAlign.center,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          ElevatedButton(
                            onPressed: () async {
                              var uri = Uri.parse(snapshot.data!.text);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: whatIsDarkMode
                                    ? backgroundColorButtonDark
                                    : themeLight.primaryColor),
                            child: const Text("Zaaktualizuj mnie!"),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicatorCustom();
                }
              },
            )
          : const Center(
              child: NoConnectionInternet(),
            ),
    );
  }
}
