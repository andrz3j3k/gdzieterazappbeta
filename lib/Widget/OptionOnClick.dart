import 'package:flutter/material.dart';

class OptionOnClick extends StatefulWidget {
  OptionOnClick({
    Key? key,
    required this.title,
    required this.function,
  }) : super(key: key);

  final String? title;
  var function;

  @override
  State<OptionOnClick> createState() => _OptionOnClickState();
}

class _OptionOnClickState extends State<OptionOnClick> {
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
      trailing: IconButton(
        onPressed: widget.function,
        icon: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
