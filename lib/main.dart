import 'package:flutter/material.dart';
import 'package:travthenticate_flutter/styles/gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 34, 192, 195),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 253, 187, 45),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      error: Colors.red,
      onError: Color.fromARGB(255, 255, 255, 255),
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 0, 0, 0),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 0, 0, 0),
    );

    const AppBarTheme appBarTheme = AppBarTheme(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );

    return MaterialApp(
      title: 'Travthenticate',
      theme: ThemeData(
        colorScheme: colorScheme,
        appBarTheme: appBarTheme,
      ),
      home: const HomePage(),
    );
  }
}

// linear-gradient(90deg, #fdbb2d 0%, #22c1c3 100%);
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: GradientText(
            text: 'Travthenticate',
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 34, 192, 195),
                Color.fromARGB(255, 253, 187, 45),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/landingpagephoto.jpg'),
            fit: BoxFit.cover,
            opacity: 0.6,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(234, 0, 0, 0), BlendMode.dstATop),
          ),
        ),
        padding: const EdgeInsets.all(18.0),
        // child: Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GradientText(
                text:
                    'Tired of the established tourist traps and ready for authentic travel experience with a local?',
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromARGB(255, 34, 192, 195),
                    Color.fromARGB(255, 253, 187, 45),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Log In'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
