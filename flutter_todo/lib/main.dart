import 'package:flutter/material.dart';
import 'login.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Laravel Auth',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const SignInPage(),
  );
}
