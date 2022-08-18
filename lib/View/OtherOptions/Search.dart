import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String dropdownValue = "Przemyśl";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: DropdownButton<String>(
        value: dropdownValue,
        iconSize: 0,
        elevation: 16,
        style: const TextStyle(
            color: Color.fromARGB(255, 232, 171, 66), fontSize: 16),
        underline: Container(
          height: 1,
          color: const Color.fromARGB(255, 232, 171, 66),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Przemyśl', 'Jarosław', 'Łańcut', 'Rzeszów']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
