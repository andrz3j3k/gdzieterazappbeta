import 'package:flutter/material.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:travelon/ScaffoldStyle.dart';
import '../../Providers/ChangeText.dart';
import 'package:provider/provider.dart';

class ButtonSearch extends StatefulWidget {
  const ButtonSearch({Key? key}) : super(key: key);

  @override
  State<ButtonSearch> createState() => _ButtonSearchState();
}

ChangeText changeText = ChangeText();
String? dropdownValue = changeText.text;

class _ButtonSearchState extends State<ButtonSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: 300,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: whatIsDarkMode
                    ? darkColorDropDownButton
                    : themeLight.primaryColor,
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                child: DropdownButton<String>(
                  dropdownColor: whatIsDarkMode
                      ? darkColorDropDownButton
                      : themeLight.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  underline: const SizedBox(),
                  value: dropdownValue,
                  iconSize: 0,
                  elevation: 16,
                  style: TextStyle(
                      fontSize: 16,
                      color: whatIsDarkMode ? darkColorText : lightColorText),
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        dropdownValue = newValue!;
                        context.read<ChangeText>().changeTexted(newValue);
                      },
                    );
                  },
                  items: kOptions.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
