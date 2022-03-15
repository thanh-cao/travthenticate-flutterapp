class User {
  final int id;
  final String name;
  final String email;
  final String? about;
  final String? interest;
  final String? location;
  final String? countrycode;
  final String? languages;
  final String? profilePicture;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.about,
    this.interest,
    this.location,
    this.countrycode,
    this.languages,
    this.profilePicture,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      about: json['about'],
      interest: json['interests'],
      location: json['location'],
      countrycode: json['countrycode'],
      languages: json['languages'],
      profilePicture: json['profilePicture'],
      createdAt: json['createdAt'],
    );
  }
}

class UserReview {
  final int id;
  final String content;
  final int reviewerId;
  final int receiverId;

  UserReview({
    required this.id,
    required this.content,
    required this.reviewerId,
    required this.receiverId,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(
      id: json['id'],
      content: json['content'],
      reviewerId: json['reviewerId'],
      receiverId: json['receiverId'],
    );
  }
}

class ContactInfo {
  final int id;
  final int userId;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? email;

  ContactInfo({
    required this.id,
    required this.userId,
    this.facebook,
    this.instagram,
    this.twitter,
    this.email,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      id: json['id'],
      userId: json['userId'],
    );
  }
}
