import 'package:flutter/material.dart';

class ObjectAfterClick extends StatelessWidget {
  const ObjectAfterClick({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(child: Text(name)),
    );
  }
}
