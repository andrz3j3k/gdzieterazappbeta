import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelon/View/MainPage/Providers.dart';
import 'View/MainPage/MainPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ChangeText(),
      ),
      ChangeNotifierProvider(
        create: (_) => RefreshList(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.w500),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}
