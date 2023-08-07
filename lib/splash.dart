import 'package:flutter/material.dart';
import 'package:kyrgyz/mColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboard.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivation',
      theme: ThemeData(
        scaffoldBackgroundColor: mColor.white_bg,
        useMaterial3: true,
        fontFamily: 'OpenSans',
      ),
      darkTheme: ThemeData(
        //darktheme
      ),
      themeMode: ThemeMode.light,
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    void openOnboard() {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const Page1()), (_) => false);
    }

    void openHome() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (_) => false);
    }

    void checkFirstLaunch() async {
      final prefs = await SharedPreferences.getInstance();
      bool first = prefs.getBool("firstLaunch") ?? false;
      if (!first) {
        openOnboard();
      } else {
        openHome();
      }
      // setState(() {
      //   _counter++;
      // });
    }

    checkFirstLaunch();
    return Scaffold(
        body: ListView(
      children: [Image.asset("assets/images/2.jpg")],
    ));
  }
}
