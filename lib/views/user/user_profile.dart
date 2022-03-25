import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../services/auth_services.dart';
import '../../services/models.dart';
import '../../services/user_services.dart';
import '../../styles/gradient_text.dart';
import 'user_details_component.dart';

class UserProfileView extends HookWidget {
  const UserProfileView({Key? key, required this.userData}) : super(key: key);
  final User userData;

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(
      () => UserService().getUserReviews(userId: userData.id),
    );

    final allReviews = useFuture(future);
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
        actions: [
          TextButton(
            onPressed: () async {
              await AuthService().logoutUser();
            },
            child: const Text('Log out'),
          ),
        ],
      ),
      body: Column(children: [
        if (allReviews.hasData)
          UserDetails(
            userData: userData,
            reviewCount: allReviews.data!['count'],
          ),
        allReviews.hasData
            ? Text('Reviews count ${allReviews.data!['count']}')
            : const Text(''),
      ]),
    );
  }
}
