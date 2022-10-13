import 'package:flutter/material.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Services/AdsService.dart';
import 'package:travelon/View/CarouselView/ObjectAfterClick.dart';
import 'package:travelon/Widget/NoConnectionInternet.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';

class MiniGame extends StatefulWidget {
  const MiniGame({Key? key}) : super(key: key);

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAds(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: NoConnectionInternet(),
          );
        } else if (snapshot.hasData) {
          return MyAds(
            list: snapshot.data!,
          );
        } else {
          return const Center(
            child: CircularProgressIndicatorCustom(),
          );
        }
      },
    );
  }
}

class MyAds extends StatelessWidget {
  const MyAds({super.key, required this.list});
  final list;
  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 50,
                  color:
                      whatIsDarkMode ? darkColorText : themeLight.primaryColor,
                ),
                Text(
                  'Aktualnie brak promocji! \n Zajrzyj wkrótce!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: whatIsDarkMode
                          ? darkColorText
                          : themeLight.primaryColor),
                ),
              ],
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                            spreadRadius: 0.5),
                      ],
                    ),
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ObjectAfterClick(
                                id: (list[index].id),
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          "https://ajlrimlsmg.cfolks.pl/Objects/Ads/${list[index].name.toLowerCase().replaceAll(" ", "")}.jpeg",
                          errorBuilder: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 40),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
