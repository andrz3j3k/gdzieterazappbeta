import 'package:flutter/material.dart';

class OptionOnClick extends StatelessWidget {
  const OptionOnClick({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

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
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
