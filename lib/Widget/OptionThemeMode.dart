import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelon/Providers/ChangeTheme.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:provider/provider.dart';
import 'package:travelon/Widget/Search.dart';

class OptionThemeMode extends StatefulWidget {
  const OptionThemeMode({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  State<OptionThemeMode> createState() => _OptionThemeModeState();
}

Search _search = const Search();

class _OptionThemeModeState extends State<OptionThemeMode> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.title}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        '${widget.subtitle}',
        style: TextStyle(
          fontSize: 10,
          color: whatIsDarkMode
              ? darkColorText
              : themeDark.scaffoldBackgroundColor,
        ),
      ),
      trailing: Switch(
        activeColor: universalColor,
        activeTrackColor:
            whatIsDarkMode ? titleTextColor : themeLight.primaryColor,
        inactiveTrackColor: Colors.grey,
        value: context.watch<ChangeTheme>().themeMode == ThemeMode.dark,
        onChanged: (newValue) {
          whatIsDarkMode = newValue;
          context.read<ChangeTheme>().toggleTheme(newValue);
          saveTheme(whatIsDarkMode);
          setState(() {});
        },
      ),
    );
  }

  saveTheme(value) async {
    final pref = await SharedPreferences.getInstance();

    pref.setBool('theme', value);
  }
}
