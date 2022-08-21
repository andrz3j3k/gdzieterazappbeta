import 'package:flutter/material.dart';
import 'package:travelon/Models/CarouselViewModel/Attraction.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton(
      {Key? key, required this.icon, required this.list, required this.index})
      : super(key: key);

  final String icon;
  final List<Attraction> list;
  final int index;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  final Map<String, IconData> icons = {
    'favourite': Icons.grade,
    'restaurant': Icons.restaurant,
    'coffee': Icons.local_cafe,
    'ancient': Icons.museum,
  };

  Color color = Colors.white;
  Color textColor = Color.fromARGB(255, 232, 171, 66);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          if (favouriteListRestaurant
              .contains(widget.list[widget.index].name)) {
            favouriteListRestaurant.remove(widget.list[widget.index].name);
          } else {
            favouriteListRestaurant.add(widget.list[widget.index].name);
          }
        });
      },
      color: favouriteListRestaurant.contains(widget.list[widget.index].name)
          ? textColor
          : color,
      textColor:
          favouriteListRestaurant.contains(widget.list[widget.index].name)
              ? color
              : textColor,
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(),
      minWidth: 1,
      child: Icon(
        icons[widget.icon],
      ),
    );
  }
}
