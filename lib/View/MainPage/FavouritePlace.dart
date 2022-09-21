import 'package:flutter/material.dart';
import 'package:travelon/ScaffoldStyle.dart';
import '../../Providers/ChangeText.dart';
import 'package:provider/provider.dart';

class FavouritePlace extends StatelessWidget {
  const FavouritePlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        context.watch<ChangeText>().text == "Gastronomia"
            ? 'Twoja ulubiona ${context.watch<ChangeText>().text}'
            : 'Twoje ulubione ${context.watch<ChangeText>().text}',
        style: TextStyle(
          fontSize: 20,
          color: whatIsDarkMode ? darkColorText : lightColorTextGrey,
        ),
      ),
    );
  }
}
