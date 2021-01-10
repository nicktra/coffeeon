import 'package:flutter/material.dart';
import 'package:coffeeon/views/splashscreen/splashscreen_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoffeeON',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Nunito",
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Nunito",
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
    );
  }
}
