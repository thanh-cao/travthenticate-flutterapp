import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:email_validator/email_validator.dart';
import 'package:travthenticate_flutter/services/auth/auth_services.dart';

class UserAuthForm extends HookWidget {
  final String textButton;
  final bool nameField;
  const UserAuthForm({
    Key? key,
    this.nameField = false,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userAuthFormKey = GlobalKey<FormState>();
    final _name = useTextEditingController();
    final _email = useTextEditingController
        .fromValue(const TextEditingValue(text: 'harry@potter.com'));
    final _password = useTextEditingController();

    return Form(
      key: _userAuthFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (nameField)
            TextFormField(
              controller: _name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                labelText: 'Name',
              ),
            ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              } else if (EmailValidator.validate(_email.text) == false) {
                return 'Wrong email format';
              }
              return null;
            },
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'Email address',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            enableSuggestions: false,
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              labelText: 'Password',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_userAuthFormKey.currentState!.validate()) {
                final result = await AuthService().loginUser(
                  email: _email.text,
                  password: _password.text,
                );

                if (((result is! User)) && result['error'] != null) {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: Text(result['error']),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text('Dismiss'),
                        ),
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: const Text('Wecome backe!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text('Dismiss'),
                        ),
                      ],
                    ),
                  );
                }
              }
            },
            child: Text(textButton),
          ),
        ],
      ),
    );
  }
}
