import 'package:flutter_survey_demo/repository/app_storage_impl.dart';
import 'package:mobx/mobx.dart';
import '../../repository/app_storage.dart';
import '../../models/local/user_model.dart';
part 'loginpage_form_store.g.dart';

class LoginPageFormStore = _LoginPageFormStore with _$LoginPageFormStore;

abstract class _LoginPageFormStore with Store {
  final AppStorage appStorage = AppStorageImpl();
  final LoginPageFormErrorState error = LoginPageFormErrorState();

  @observable
  String username = '';

  @observable
  bool isPasswordVisible = false;

  @observable
  String password = '';
  
  _LoginPageFormStore(){
    isPasswordVisible = false;
  }
  @action
  void toggleVisibility(){
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void setPassword(String value){
    password = value;
  }

  @action
  void setUsername(String value){
    username = value;
  }


  @action 
  void login(){
    User user = User(username,password);
    appStorage.logIn(user);
  }
  @action
  bool validateAll(){
    error.usernameError=null;
    error.passwordError=null;
    if(username==''||username.length<6){
      error.usernameError='Invalid username';
      return false;
    }

    if(password==''){
      error.passwordError='Invalid password';
      return false;
    }
    login();
    return true;
  }
}



class LoginPageFormErrorState = _LoginPageFormErrorState with _$LoginPageFormErrorState;

abstract class _LoginPageFormErrorState with Store{
  @observable
  String? usernameError;

  @observable
  String? passwordError;
}