import 'package:flutter/material.dart';
import 'package:travelon/Models/OtherOptionsModel/regulations.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Services/RegulationsService.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';

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
              return const Center(
                child: NoConnectionInternet(),
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
              return const Center(child: CircularProgressIndicatorCustom());
            }
          },
        ),
      ),
    );
  }
}
