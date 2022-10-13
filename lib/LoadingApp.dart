import 'package:flutter/material.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({super.key, required this.text, required this.type});
  String text;
  String type;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.type == "Brak aktualizacji"
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 40,
                      color: whatIsDarkMode
                          ? darkColorText
                          : themeLight.primaryColor,
                    ),
                    Text(
                      widget.text,
                      textAlign: TextAlign.center,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    ElevatedButton(
                      onPressed: () async {
                        var uri = Uri.parse(
                            "https://play.google.com/store/apps/details?id=com.kitkagames.fallbuddies&gl=PL");
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                      child: const Text("Zaaktualizuj mnie!"),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 40,
                    color: whatIsDarkMode
                        ? darkColorText
                        : themeLight.primaryColor,
                  ),
                  Text(widget.text),
                ],
              ),
            ),
    );
  }
}