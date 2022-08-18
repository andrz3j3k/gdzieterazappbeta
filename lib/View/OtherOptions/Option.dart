import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        '$subtitle',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      trailing: Switch(
        value: false,
        onChanged: (value) {
          value = true;
        },
      ),
    );
  }
}
