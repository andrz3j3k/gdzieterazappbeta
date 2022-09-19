import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:travelon/Providers/ChangeText.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton(
      {Key? key, required this.icon, required this.list, required this.index})
      : super(key: key);

  final String icon;
  final List<dynamic> list;
  final int index;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  final Map<String, IconData> icons = {
    'favourite': Icons.grade,
    'web': Icons.web,
    'phone': Icons.phone,
  };

  ChangeText ct = ChangeText();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.icon == "favourite"
          ? favourite
          : widget.icon == "web"
              ? web
              : phone,
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
}
