import 'package:azkar_app/screens/home_screen.dart';
import 'package:azkar_app/screens/launch_screen.dart';
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
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen':(context) => LaunchScreen(),
          '/main_screen':(context) => HomeScreen()
        },
      home: const HomeScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
            titleSmall: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 22.0,
            )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          centerTitle: true
        )
      ),
    );
  }
}
