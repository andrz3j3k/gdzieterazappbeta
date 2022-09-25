import 'package:flutter/material.dart';
import 'package:travelon/Models/OtherOptionsModel/regulations.dart';
import 'package:travelon/ScaffoldStyle.dart';
import 'package:travelon/Services/RegulationsService.dart';

class RegulationsInfo extends StatelessWidget {
  const RegulationsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            whatIsDarkMode ? themeDark.primaryColor : themeLight.primaryColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: FutureBuilder<List<Regulations>>(
          future: fetchRegulations(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.wifi_off,
                      size: 40,
                    ),
                    Text('Brak połączenia z internetem'),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Text(data[index].tekst);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
