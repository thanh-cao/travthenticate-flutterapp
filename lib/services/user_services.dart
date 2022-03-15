import '../constants/urls.dart';
import 'models.dart';
import 'session.dart';

class UserService {
  final http = Session();

  static final UserService _shared = UserService._sharedInstance();
  UserService._sharedInstance();
  factory UserService() => _shared;

  Future<List<User>> getAllUsers() async {
    const String url = '$apiUrl/users';
    List results = await http.get(url);
    List<User> allUsers = [];
    for (var user in results) {
      allUsers.add(User.fromJson(user));
    }

    return allUsers;
  }
}
