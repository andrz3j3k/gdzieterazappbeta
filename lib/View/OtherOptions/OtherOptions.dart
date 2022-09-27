import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/View/OtherOptions/PageInfo.dart';
import 'package:url_launcher/url_launcher.dart';

import 'OptionOnClick.dart';
import 'OptionThemeMode.dart';
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
          const OptionThemeMode(
            title: 'Tryb ciemny',
            subtitle: 'Przełącz pomiędzy trybem jasnym, a ciemnym.',
          ),
          const Categories(categorie: 'Informacje prawne'),
          OptionOnClick(
            title: 'Regulamin',
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegulationsInfo(),
                ),
              );
            },
          ),

          // OptionOnClick(
          //   title: 'Kontakt',
          // ),
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
