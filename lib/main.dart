import 'package:appflower/widgets/pages/greeting_page.dart';
import 'package:appflower/widgets/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/greeting': (context) => const GreetingPage(),
      },
      theme: ThemeData(colorSchemeSeed: Colors.amberAccent),
    );
  }
}
