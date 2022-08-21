import 'package:flutter/material.dart';
import '../../Providers/ChangeText.dart';
import 'package:provider/provider.dart';

class FavouritePlace extends StatelessWidget {
  const FavouritePlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        'Twoje ulubione ${context.watch<ChangeText>().text}',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black54,
        ),
      ),
    );
  }
}
