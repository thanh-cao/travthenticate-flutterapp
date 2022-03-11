import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:travthenticate_flutter/constants/routes.dart';
import 'package:travthenticate_flutter/forms/user_auth_form.dart';

import '../styles/gradient_text.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Log In',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const UserAuthForm(
              textButton: 'Log in',
            ),
            const SizedBox(
              height: 10.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign up!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          signupRoute,
                          ModalRoute.withName('/'),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
