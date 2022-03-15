import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../services/models.dart';

class UserCard extends HookWidget {
  final User userData;
  final void Function(User user) onTap;

  const UserCard({Key? key, required this.onTap, required this.userData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl = userData.profilePicture ??
        'https://github.com/thanh-cao/awa-grad-project-front/blob/main/src/photos/profilePlaceholder.png?raw=true';

    final profileImg = useMemoized(
        // grab the image from network, load it, and store it in an Image widget
        () {
      return Image.network(
        imgUrl,
        errorBuilder: ((context, error, stackTrace) {
          return Image.asset('assets/profilePlaceholder.png');
        }),
      );
    });

    return InkWell(
      onTap: () => onTap(userData),
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                child: profileImg,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Location: ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: userData.location ?? 'Location unknown',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Interests: ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              userData.interest ?? 'No interests to display...',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
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
