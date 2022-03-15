import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:travthenticate_flutter/views/user/user_profile.dart';

import '../../services/auth_services.dart';
import '../../services/user_services.dart';
import '../../styles/gradient_text.dart';
import 'user_card.dart';

class UserFeedView extends HookWidget {
  const UserFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(
      () => UserService().getAllUsers(),
    );
    final allUsers = useFuture(future);

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
      body: Column(
        children: [
          const Text('User feed view'),
          // const UserAuthForm(textButton: 'Login'),
          allUsers.hasData
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: allUsers.data!.toList().length,
                      itemBuilder: (BuildContext context, int index) {
                        final user = allUsers.data![index];
                        return UserCard(
                          onTap: (user) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserProfileView(userData: user)),
                            );
                          },
                          userData: user,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Theme.of(context).colorScheme.primary,
                        );
                      },
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            const Text('People'),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            const Text('Events'),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            const Text('My Profile'),
          ],
        ),
      ),
    );
  }
}
