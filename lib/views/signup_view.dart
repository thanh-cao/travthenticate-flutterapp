import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:travthenticate_flutter/forms/user_auth_form.dart';

import '../styles/gradient_text.dart';

class SignupView extends HookWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final email = useState('');
    final password = useState('');

    useEffect(
      () {
        _emailController.addListener(() {
          email.value = _emailController.text;
        });
        return null;
      },
      [_emailController],
    );
    useEffect(
      () {
        _passwordController.addListener(() {
          password.value = _passwordController.text;
        });
        return null;
      },
      [_passwordController],
    );

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
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const UserAuthForm(
              textButton: 'Sign up',
              nameField: true,
            ),
            const SizedBox(
              height: 10.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  TextSpan(
                    text: 'Log in!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Tap to log in view');
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
