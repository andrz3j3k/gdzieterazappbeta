import 'package:flutter/material.dart';
import 'package:travelon/Models/CarouselViewModel/Attraction.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:travelon/Providers/ChangeText.dart';

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

  Color color = Colors.white;
  Color textColor = Color.fromARGB(255, 232, 171, 66);
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
                  break;
                }
              case 'Zabytki':
                {
                  favouriteListMonuments.remove(widget.list[widget.index].name);
                  break;
                }
            }
          } else {
            list.add(widget.list[widget.index].name);
          }
        });
      },
      color: list.contains(widget.list[widget.index].name) ? textColor : color,
      textColor:
          list.contains(widget.list[widget.index].name) ? color : textColor,
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(),
      minWidth: 1,
      child: Icon(
        icons[widget.icon],
      ),
    );
  }
}
