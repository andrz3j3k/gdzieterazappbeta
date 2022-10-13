import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:travelon/Providers/ChangeText.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Services/OpeningHours.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';
import 'package:url_launcher/url_launcher.dart';

class FavouriteCarouselView extends StatefulWidget {
  const FavouriteCarouselView(
      {Key? key, required this.icon, required this.list, required this.index})
      : super(key: key);

  final String icon;
  final List<dynamic> list;
  final int index;

  @override
  State<FavouriteCarouselView> createState() => _FavouriteCarouselViewState();
}

class _FavouriteCarouselViewState extends State<FavouriteCarouselView> {
  final Map<String, IconData> icons = {
    'favourite': Icons.grade,
    'web': Icons.web,
    'phone': Icons.phone,
    'info': Icons.info_outline,
  };

  ChangeText ct = ChangeText();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.icon == "favourite"
          ? favourite
          : widget.icon == "web"
              ? web
              : widget.icon == "phone"
                  ? phone
                  : info,
      color: widget.icon == "favourite"
          ? list.contains(widget.list[widget.index].name)
              ? whatIsDarkMode
                  ? themeDark.primaryColor
                  : themeLight.primaryColor
              : whatIsDarkMode
                  ? backgroundColorButtonDark
                  : Colors.white
          : whatIsDarkMode
              ? backgroundColorButtonDark
              : Colors.white,
      textColor: widget.icon == "favourite"
          ? list.contains(widget.list[widget.index].name)
              ? whatIsDarkMode
                  ? universalColor
                  : Colors.white
              : whatIsDarkMode
                  ? universalColor
                  : themeLight.primaryColor
          : whatIsDarkMode
              ? universalColor
              : themeLight.primaryColor,
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(),
      minWidth: 1,
      child: Icon(
        icons[widget.icon],
      ),
    );
  }

  favourite() {
    saveGastronomy(List<String> list) async {
      final pref = await SharedPreferences.getInstance();
      pref.setStringList('favouriteGastronomy', list);
    }

    saveAttractions(List<String> list) async {
      final pref = await SharedPreferences.getInstance();

      pref.setStringList('favouriteAttractions', list);
    }

    saveLocalProducts(List<String> list) async {
      final pref = await SharedPreferences.getInstance();

      pref.setStringList('favouriteLocalProducts', list);
    }

    setState(
      () {
        if (list.contains(widget.list[widget.index].name)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              backgroundColor: whatIsDarkMode
                  ? themeDark.primaryColor
                  : themeLight.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              behavior: SnackBarBehavior.floating,
              content: Text(
                "Usunięte z ulubionych: ${widget.list[widget.index].name}",
              ),
            ),
          );
          switch (ct.text) {
            case 'Gastronomia':
              {
                favouriteListGastronomy.remove(widget.list[widget.index].name);
                saveGastronomy(list.toList().cast());
                break;
              }
            case 'Atrakcje':
              {
                favouriteListAttractions.remove(widget.list[widget.index].name);
                saveAttractions(list.toList().cast());
                break;
              }
            case 'Produkty lokalne':
              {
                favouriteListLocalProducts
                    .remove(widget.list[widget.index].name);
                saveLocalProducts(list.toList().cast());
                break;
              }
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: whatIsDarkMode
                  ? themeDark.primaryColor
                  : themeLight.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 1),
              content: Text(
                "Dodane do ulubionych: ${widget.list[widget.index].name}",
              ),
            ),
          );

          list.add(widget.list[widget.index].name);
          switch (ct.text) {
            case 'Gastronomia':
              saveGastronomy(list.toList().cast());
              break;

            case 'Atrakcje':
              saveAttractions(list.toList().cast());
              break;
            case 'Produkty lokalne':
              saveLocalProducts(list.toList().cast());
              break;
          }

          setState(() {});
        }
      },
    );
  }

  web() async {
    var uri = Uri.parse(widget.list[widget.index].www);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  phone() {
    launchUrl(Uri.parse("tel: ${widget.list[widget.index].numberPhone}"));
  }

  info() {
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
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: whatIsDarkMode
                ? themeDark.primaryColor
                : themeLight.primaryColor,
            child: Center(
              child: FutureBuilder(
                future: fetchOpeningHours(widget.list[widget.index].idobject),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: NoConnectionInternet(),
                    );
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: const Text(
                              "Godziny otwarcia:",
                              style: TextStyle(color: Colors.white),
                            )),
                        InfoText(day: 'pon:', time: data.pon),
                        InfoText(day: 'wt:', time: data.wt),
                        InfoText(day: 'śr:', time: data.sr),
                        InfoText(day: 'czw:', time: data.czw),
                        InfoText(day: 'pt:', time: data.pt),
                        InfoText(day: 'sob:', time: data.sob),
                        InfoText(day: 'nd:', time: data.nd),
                      ],
                    );
                  } else {
                    return const Align(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicatorCustom());
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class InfoText extends StatelessWidget {
  InfoText({super.key, required this.day, required this.time});
  String day, time;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$day $time",
      style: TextStyle(color: Colors.white),
    );
  }
}
