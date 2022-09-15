import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:travelon/Providers/ChangeText.dart';
import 'package:travelon/ScaffoldStyle.dart';

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
  };
  saveRestaurant(List<String> list) async {
    final pref = await SharedPreferences.getInstance();
    pref.setStringList('favouriteRestaurant', list);
  }

  saveCafe(List<String> list) async {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList('favouriteMonuments', list);
  }

  saveBar(List<String> list) async {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList('favouriteMonuments', list);
  }

  saveAttractions(List<String> list) async {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList('favouriteMonuments', list);
  }

  saveLocalProducts(List<String> list) async {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList('favouriteMonuments', list);
  }

  ChangeText ct = ChangeText();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          if (list.contains(widget.list[widget.index].name)) {
            switch (ct.text) {
              case 'Restauracje':
                {
                  favouriteListRestaurant
                      .remove(widget.list[widget.index].name);
                  saveRestaurant(list.toList().cast());
                  break;
                }
              case 'Kawiarnie':
                {
                  favouriteListMonuments.remove(widget.list[widget.index].name);
                  saveCafe(list.toList().cast());
                  break;
                }
              case 'Bary':
                {
                  favouriteListMonuments.remove(widget.list[widget.index].name);
                  saveCafe(list.toList().cast());
                  break;
                }
              case 'Atrakcje':
                {
                  favouriteListMonuments.remove(widget.list[widget.index].name);
                  saveCafe(list.toList().cast());
                  break;
                }
              case 'Produkty lokalne':
                {
                  favouriteListMonuments.remove(widget.list[widget.index].name);
                  saveCafe(list.toList().cast());
                  break;
                }
            }
          } else {
            list.add(widget.list[widget.index].name);
            switch (ct.text) {
              case 'Restauracje':
                saveRestaurant(list.toList().cast());
                break;
              case 'Kawiarnie':
                saveCafe(list.toList().cast());
                break;
              case 'Bary':
                saveRestaurant(list.toList().cast());
                break;
              case 'Atrakcje':
                saveCafe(list.toList().cast());
                break;
              case 'Produkty lokalne':
                saveCafe(list.toList().cast());
                break;
            }

            setState(() {});
          }
        });
      },
      color: list.contains(widget.list[widget.index].name)
          ? whatIsDarkMode
              ? themeDark.primaryColor
              : themeLight.primaryColor
          : whatIsDarkMode
              ? backgroundColorButtonDark
              : Colors.white,
      textColor: list.contains(widget.list[widget.index].name)
          ? whatIsDarkMode
              ? universalColor
              : Colors.white
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
}
