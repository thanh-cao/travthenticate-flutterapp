import 'package:flutter/material.dart';
import 'package:travthenticate_flutter/constants/routes.dart';

import '../styles/gradient_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GradientText(
          text: 'Travthenticate',
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromARGB(255, 34, 192, 195),
              Color.fromARGB(255, 253, 187, 45),
            ],
          ),
        ),
        centerTitle: true,
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
                    onPressed: () {
                      Navigator.of(context).pushNamed(loginRoute);
                    },
                    child: const Text('Log In'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(signupRoute);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 34, 192, 195),
                Color.fromARGB(255, 253, 187, 45),
              ],
            ),
          ),
          child: Text(
            'Copyright ?? ${DateTime.now().year}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
