import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  Option({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
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
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      trailing: Switch(
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
