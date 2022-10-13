import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Services/IndividualPageService.dart';
import 'package:travelon/View/CarouselView/Page.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';

class ObjectAfterClick extends StatelessWidget {
  const ObjectAfterClick({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchIndividualPageData(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const NoConnectionInternet(),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          whatIsDarkMode
                              ? HexColor('373590')
                              : HexColor('E8AA42'),
                        ),
                      ),
                      child: const Icon(
                        Icons.home,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            var list = snapshot.data!;
            return ListPage(
              list: list,
            );
          } else {
            return const Center(
              child: CircularProgressIndicatorCustom(),
            );
          }
        },
      ),
    );
  }
}
