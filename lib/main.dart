import 'package:flutter/material.dart';
import 'package:travthenticate_flutter/styles/color_themes.dart';
import 'package:travthenticate_flutter/views/login_view.dart';
import 'views/homepage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travthenticate',
      theme: ThemeData(
        colorScheme: colorScheme,
        appBarTheme: appBarTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData,
      ),
      home: const LoginView(),
    );
  }
}
