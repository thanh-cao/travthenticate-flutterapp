import '../../constants/urls.dart';
import '../session.dart';

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

class AuthService {
  final http = Session();

  static final AuthService _shared = AuthService._sharedInstance();
  AuthService._sharedInstance();
  factory AuthService() => _shared;

  // User get currentUser => authenticateUser();

  Future<dynamic> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    const String url = '$apiUrl/users/register';

    final result = await http.post(
      url: url,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (result['error'] == null) {
      return User.fromJson(result);
    } else {
      return result;
    }
  }

  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    const String url = '$apiUrl/users/login';

    final result = await http.post(
      url: url,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (result['error'] == null) {
      return User.fromJson(result);
    } else {
      return result;
    }
  }

  Future<dynamic> logoutUser() async {
    const String url = '$apiUrl/users/logout';
    return http.get(url);
  }

  Future<dynamic> authenticateUser() async {
    const String url = '$apiUrl/users/authenticate';
    return http.get(url);
  }
}
