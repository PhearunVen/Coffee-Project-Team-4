import 'package:coffee_app_ui/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor:
            Colors.black, // Set the scaffold background color to black
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.black, // Set the AppBar background color to black
          iconTheme:
              const IconThemeData(color: Colors.white), // Icon color in AppBar
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20), // AppBar title color
        ),

        primaryColor: Colors.black,
      ),
    );
  }
}
