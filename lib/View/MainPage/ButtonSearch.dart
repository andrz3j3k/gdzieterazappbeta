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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return MainPageApp.kOptions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
              return TextField(
                focusNode: focusNode,
                controller: textEditingController,
                onEditingComplete: onFieldSubmitted,
                decoration: InputDecoration(
                  hintText: context.read<ChangeText>().text,
                  hintStyle: const TextStyle(height: 2.8),
                  prefixIcon: const Icon(Icons.search_outlined),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              );
            },
            onSelected: (String selection) {
              setState(
                () {
                  () {
                    if (context.watch<ChangeText>().text == "Restauracje") {
                      list = listRestaurant;
                    } else if (context.watch<ChangeText>().text == "Zabytki") {
                      list = listMonuments;
                    }
                  };
                  context.read<ChangeText>().changeTexted(selection);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
