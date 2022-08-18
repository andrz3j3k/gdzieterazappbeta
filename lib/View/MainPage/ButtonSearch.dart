import 'package:flutter/material.dart';
import 'package:travelon/View/MainPage/ListAttraction.dart';
import 'package:travelon/main.dart';
import 'MainPage.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'Providers.dart';
import 'package:provider/provider.dart';

class ButtonSearch extends StatefulWidget {
  const ButtonSearch({Key? key}) : super(key: key);

  @override
  State<ButtonSearch> createState() => _ButtonSearchState();
}

class _ButtonSearchState extends State<ButtonSearch> {
  String dropdownValue = MainPageApp.kOptions[0];
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
                color: const Color.fromARGB(255, 232, 171, 66),
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                child: DropdownButton<String>(
                  dropdownColor: const Color.fromARGB(255, 232, 171, 66),
                  borderRadius: BorderRadius.circular(10),
                  value: dropdownValue,
                  iconSize: 0,
                  elevation: 16,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  underline: Container(
                    height: 0,
                    color: const Color.fromARGB(255, 232, 171, 66),
                  ),
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        dropdownValue = newValue!;
                        context.read<ChangeText>().changeTexted(newValue);
                      },
                    );
                  },
                  items: MainPageApp.kOptions.map<DropdownMenuItem<String>>(
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
