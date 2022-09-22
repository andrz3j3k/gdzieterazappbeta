import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../ScaffoldStyle.dart';
import '../../View/CarouselView/ObjectAfterClick.dart';

const initialCameraPositionPrzemysl = CameraPosition(
    target: LatLng(49.78399107263073, 22.76809200528949), zoom: 13);

Set<Marker> markers = {};
var listLocation;
getMarker(context) {
  markers.clear();
  for (int i = 0; i < listLocation.length; i++) {
    markers.add(
      Marker(
        markerId: MarkerId(i.toString()),
        position: LatLng(
            double.parse(listLocation[i].x), double.parse(listLocation[i].y)),
        icon: BitmapDescriptor.defaultMarkerWithHue(10),
        onTap: () {
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            backgroundColor: whatIsDarkMode
                ? themeDark.scaffoldBackgroundColor
                : themeLight.scaffoldBackgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            builder: (context) {
              return ClipRRect(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://ajlrimlsmg.cfolks.pl/Objects/Ads/${listLocation[i].name.toLowerCase().replaceAll(" ", "")}.jpeg",
                              errorWidget: (context, url, error) => const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 40),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black54,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 40,
                              ),
                              alignment: Alignment.topCenter,
                              child: AutoSizeText(
                                listLocation[i].name,
                                style: TextStyle(
                                  color: whatIsDarkMode
                                      ? darkColorText
                                      : Colors.white,
                                ),
                                minFontSize: 25,
                                maxFontSize: 32,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ObjectAfterClick(
                                      id: (listLocation[i].id),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: ButtonButtomSheet(
                            function: () {
                              launchUrl(Uri.parse(
                                  "tel: ${listLocation[i].numberPhone}"));
                            },
                            icon: const Icon(
                              Icons.phone,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ButtonButtomSheet(
                            function: () async {
                              final String google = listLocation[i].route;
                              if (await canLaunchUrl(Uri.parse(google))) {
                                await launchUrl(Uri.parse(google));
                              }
                            },
                            icon: const Icon(
                              Icons.navigation,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80, bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ButtonButtomSheet(
                            icon: const Icon(
                              Icons.web,
                              size: 30,
                            ),
                            function: () async {
                              var uri = Uri.parse(listLocation[i].www);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
  return markers;
}

class ButtonButtomSheet extends StatefulWidget {
  ButtonButtomSheet({super.key, required this.icon, required this.function});
  Icon icon;
  var function;

  @override
  State<ButtonButtomSheet> createState() => _ButtonButtomSheetState();
}

class _ButtonButtomSheetState extends State<ButtonButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.function,
      color: whatIsDarkMode ? themeDark.primaryColor : themeLight.primaryColor,
      textColor: whatIsDarkMode ? universalColor : Colors.white,
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(),
      minWidth: 1,
      child: widget.icon,
    );
    ;
  }
}
