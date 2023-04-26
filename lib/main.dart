import 'package:azkar_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
            titleSmall: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 22.0,
            )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green
        )
      ),
    );
  }
}
