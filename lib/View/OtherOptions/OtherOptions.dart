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
        children: const [
          Categories(categorie: 'Wybierz miasto'),
          Search(),
          Categories(categorie: 'Wygląd'),
          OptionThemeMode(
            title: 'Tryb ciemny',
            subtitle: 'Switch',
          ),
          Categories(categorie: 'Informacje prawne'),
          OptionOnClick(
            title: 'Regulamin',
          ),
          Categories(categorie: 'Kontakt'),
          OptionOnClick(
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
