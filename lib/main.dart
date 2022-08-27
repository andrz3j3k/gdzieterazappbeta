import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:travelon/ScaffoldStyle.dart';
import 'Models/CityMapModel/GoogleMapsApi.dart';
import 'View/MainPage/MainPage.dart';
import 'package:provider/provider.dart';
import 'Providers/ChangeObject.dart';
import 'Providers/ChangeText.dart';
import 'Providers/RefreshList.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChangeText(),
        ),
        ChangeNotifierProvider(
          create: (_) => RefreshList(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangeObject(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeLight,
      themeMode: ThemeMode.light,
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
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        listLocation = snapshot.data;
        Timer(
          Duration(seconds: 3),
          () => getMarker(),
        );
        return const MainPage();
      },
    );
  }
}
