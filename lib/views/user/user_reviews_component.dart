import 'package:flutter/material.dart';

import '../../services/models.dart';

class UserReviews extends StatelessWidget {
  const UserReviews({Key? key, required this.allReviews}) : super(key: key);
  final Map allReviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(
        vertical: 26.0,
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews (${allReviews['count']})',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: allReviews['count'],
            itemBuilder: (context, index) {
              return ReviewCard(
                review: allReviews['reviews'][index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key, required this.review}) : super(key: key);
  final UserReview review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
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
              // child: Image.asset('assets/profilePlaceholder.png'),
              child: Image.network(review.reviewer['profilePicture'],
                  fit: BoxFit.cover,
                  errorBuilder: ((context, error, stackTrace) {
                return Image.asset('assets/profilePlaceholder.png');
              })),
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
                  '${review.reviewer['name']}, ${review.reviewer['location']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                Text(
                  review.createdAt,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  review.content,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
