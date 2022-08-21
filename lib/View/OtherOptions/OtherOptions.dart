import 'package:travelon/ScaffoldStyle.dart';

import 'OptionOnClick.dart';
import 'Option.dart';
import 'Search.dart';
import 'package:flutter/material.dart';

class OtherOptions extends StatefulWidget {
  const OtherOptions({Key? key}) : super(key: key);

  @override
  State<OtherOptions> createState() => _OtherOptions();
}

class _OtherOptions extends State<OtherOptions> {
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).viewPadding;
    return Container(
      padding: topPadding + const EdgeInsets.only(left: 25, top: 25),
      child: Column(
        children: [
          const Categories(categorie: 'Wybierz miasto'),
          const Search(),
          const Categories(categorie: 'Wygląd'),
          Option(
            title: 'Tryb ciemny',
            subtitle: 'Switch',
          ),
          const Categories(categorie: 'Lokalizacja'),
          Option(
            title: 'Lokalizacja domyślna',
            subtitle:
                'Aplikacja automatycznie dostosowuje się do miasta w którym jesteś!',
          ),
          const Categories(categorie: 'Informacje prawne'),
          const OptionOnClick(
            title: 'Regulamin',
          ),
          const Categories(categorie: 'Kontakt'),
          const OptionOnClick(
            title: 'Kontakt',
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.categorie}) : super(key: key);

  final String? categorie;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('$categorie'),
    );
  }
}
