import 'package:flutter/material.dart';

class NoConnectionInternet extends StatelessWidget {
  const NoConnectionInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.wifi_off,
          size: 40,
        ),
        Text('Brak połączenia z internetem'),
      ],
    );
  }
}
