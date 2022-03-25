import 'package:flutter/material.dart';
import 'package:travthenticate_flutter/services/models.dart';

class UserDetails extends StatelessWidget {
  const UserDetails(
      {Key? key, required this.userData, required this.reviewCount})
      : super(key: key);
  final User userData;
  final int reviewCount;
  @override
  Widget build(BuildContext context) {
    String imgUrl = userData.profilePicture ??
        'https://github.com/thanh-cao/awa-grad-project-front/blob/main/src/photos/profilePlaceholder.png?raw=true';

    String joinedDate = userData.createdAt.split('T')[0];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 26.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      // child: Image.asset('assets/profilePlaceholder.png'),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                        errorBuilder: ((context, error, stackTrace) {
                          return Image.asset('profilePlaceholder.png');
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
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
                          height: 10,
                        ),
                        Text(
                          'Joined on $joinedDate',
                          // style: Theme.of(context).textTheme.body2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$reviewCount Reviews',
                          // style: Theme.of(context).textTheme.body2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('Write review to ${userData.name}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
          thickness: 1,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 26.0,
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                userData.about ?? 'No description to display...',
                // style: Theme.of(context).textTheme.body2,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Interests',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                userData.interest ?? 'No interests to display...',
                // style: Theme.of(context).textTheme.body2,
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' Location: ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: userData.location ?? 'Unknown',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.language,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' Speaks: ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: userData.languages ?? 'Unknown',
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
        Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
          thickness: 1,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
        ),
      ],
    );
  }
}
