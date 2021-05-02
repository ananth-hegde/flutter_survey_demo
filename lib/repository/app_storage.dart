import '../models/local/user_model.dart';

abstract class AppStorage{
  void logIn(User user);
  Future<bool> isLoggedIn();
  Future<String> getLoggedInUsername();
  void logOut();
}