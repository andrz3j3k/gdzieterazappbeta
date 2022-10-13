import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelon/LoadingApp.dart';
import 'package:travelon/Models/MainModel.dart';
import 'package:travelon/Models/MainPageModel/MainPageModel.dart';
import 'package:travelon/Providers/ChangeTheme.dart';
import 'package:travelon/Style/ScaffoldStyle.dart';
import 'package:travelon/Widget/ProgressIndicator.dart';
import 'Models/MainPageModel/MainText.dart';
import 'View/MainPage/MainPage.dart';
import 'package:provider/provider.dart';
import 'Providers/ChangeText.dart';
import 'Providers/RefreshList.dart';
import 'package:http/http.dart' as http;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  Settings.version = packageInfo.version;
  final pref = await SharedPreferences.getInstance();

  whatIsDarkMode = pref.getBool('theme') ?? false;

  if (pref.getStringList('favouriteGastronomy') != null) {
    favouriteListGastronomy =
        pref.getStringList('favouriteGastronomy')!.toSet();
  }
  if (pref.getStringList('favouriteAttractions') != null) {
    favouriteListAttractions =
        pref.getStringList('favouriteAttractions')!.toSet();
  }
  if (pref.getStringList('favouriteLocalProducts') != null) {
    favouriteListLocalProducts =
        pref.getStringList('favouriteLocalProducts')!.toSet();
  }

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: whatIsDarkMode
          ? themeDark.scaffoldBackgroundColor
          : themeLight.scaffoldBackgroundColor,
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
    getTheme();
    ChangeTheme().addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  getTheme() async {
    final pref = await SharedPreferences.getInstance();
    bool value = pref.getBool('theme') ?? false;

    if (value == false) {
      whatIsDarkMode = false;
      context.read<ChangeTheme>().themeMode = ThemeMode.light;
    } else {
      whatIsDarkMode = true;
      context.read<ChangeTheme>().themeMode = ThemeMode.dark;
    }

    setState(() {});
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
  Future<MainText> fetchtext() async {
    //pobranie strony WWW
    final response = await http.post(
      Uri.parse('https://ajlrimlsmg.cfolks.pl/Scripts/maindisplaytext.php'),
      body: {
        "id": "2",
      },
    );

    // Use the compute function to run parsePhotos in a separate isolate.
    return MainText.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchtext(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return GestureDetector(
            onTap: () {
              setState(() {
                build(context);
              });
            },
            child: Scaffold(
              body: LoadingPage(
                  text: "Brak połączenia z internetem!",
                  type: "Brak internetu"),
            ),
          );
        } else if (snapshot.hasData) {
          if (Settings.version == snapshot.data!.text) {
            return const MainPage();
          } else {
            return Scaffold(
              body: LoadingPage(
                text:
                    "Pojawiła się nowa aktualizacja aplikacji. Zaaktualizuj aplikację, aby mogła informować Cię o nowych promocjach i wydarzeniach!",
                type: "Brak aktualizacji",
              ),
            );
          }
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicatorCustom()));
        }
      },
    );
  }
}
