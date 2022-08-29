import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelon/Providers/ChangeTheme.dart';
import 'package:travelon/ScaffoldStyle.dart';
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
        ChangeNotifierProvider(
          create: (_) => ChangeTheme(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    ChangeTheme().removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    ChangeTheme().addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: themeDark,
      theme: themeLight,
      themeMode: context.watch<ChangeTheme>().themeMode,
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
