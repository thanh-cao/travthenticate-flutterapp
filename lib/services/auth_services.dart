import '../constants/urls.dart';
import 'models.dart';
import 'session.dart';

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
