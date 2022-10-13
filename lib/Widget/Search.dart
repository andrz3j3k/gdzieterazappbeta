import 'package:flutter/material.dart';
import 'package:travelon/Providers/ChangeTheme.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import '../Models/OtherOptionsModel/SearchModel.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String dropdownValue = listCity[0];
  @override
  Widget build(BuildContext context) {
    setState(() {
      context.watch<ChangeTheme>().themeMode;
    });
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: DropdownButton<String>(
        value: dropdownValue,
        iconSize: 0,
        elevation: 16,
        style: TextStyle(
          color: whatIsDarkMode ? darkColorText : themeLight.primaryColor,
          fontSize: 16,
        ),
        dropdownColor:
            whatIsDarkMode ? themeDark.scaffoldBackgroundColor : Colors.white,
        underline: Container(
          height: 1,
          color: whatIsDarkMode ? darkColorText : themeLight.primaryColor,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: listCity.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
