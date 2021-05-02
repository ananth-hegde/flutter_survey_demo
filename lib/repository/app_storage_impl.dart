import '../models/app_model.dart';
import '../models/local/user_model.dart';

import 'package:hive/hive.dart';
import 'app_storage.dart';

class AppStorageImpl implements AppStorage{
  void logIn(User user) async{
    final usersBox = await Hive.openBox('users');
    usersBox.put('current_user',user);
    final appBox = await Hive.openBox('app');
    final appState = AppModel(true);
    appBox.put('current_state',appState);
  }

  Future<bool> isLoggedIn() async{
    final appBox = await Hive.openBox('app');
    AppModel? appModel = appBox.get('current_state');
    if(appModel==null)
      return false;
    return appModel.isLoggedIn;
  }

  void logOut() async{
    final appBox = await Hive.openBox('app');
    AppModel appModel = appBox.get('current_state');
    appModel.isLoggedIn = false;
    appModel.save();
  }

  Future<String> getLoggedInUsername() async{
    final userBox = await Hive.openBox('users');
    User currentUser = userBox.get('current_user');
    return currentUser.username;
  }  
}