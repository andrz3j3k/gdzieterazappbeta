import 'package:flutter/material.dart';

class ButtonFilter extends StatelessWidget {
  ButtonFilter({Key? key, this.icon}) : super(key: key);

  final String? icon;
  final Map<String, IconData> icons = {
    'favourite': Icons.grade,
    'restaurant': Icons.restaurant,
    'coffee': Icons.local_cafe,
    'ancient': Icons.museum,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      color: Colors.white,
      textColor: const Color.fromARGB(255, 232, 171, 66),
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(),
      minWidth: 1,
      child: Icon(
        icons[icon],
      ),
    );
  }
}
