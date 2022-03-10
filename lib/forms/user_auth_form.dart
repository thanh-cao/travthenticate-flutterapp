import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

import '../constants/urls.dart';

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
              final Map<String, String> userInputs = {
                'email': _email.text.toString(),
                'password': _password.text.toString(),
              };
              if (_userAuthFormKey.currentState!.validate()) {
                try {
                  const String dataUrl = '$apiUrl/users/login';
                  final response = await http.post(
                    Uri.parse(
                      dataUrl,
                    ),
                    headers: {'Content-Type': 'application/json'},
                    body: json.encode(userInputs),
                  );
                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content: const Text('Welcome back'),
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
                        content: Text(json.decode(response.body)['error']),
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
                } catch (err) {
                  //
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
