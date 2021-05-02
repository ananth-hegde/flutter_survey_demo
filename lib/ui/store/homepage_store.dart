import 'package:flutter_survey_demo/repository/app_storage_impl.dart';
import 'package:mobx/mobx.dart';
import '../../repository/app_storage.dart';


part 'homepage_store.g.dart';
class HomepageStore = _HomepageStore with _$HomepageStore;

abstract class _HomepageStore with Store{
  AppStorage appStorage = AppStorageImpl();


  @observable
  int index=0;

  @observable
  String? username;

  _HomepageStore(){
    index = 0;
  }

  @action
  void changeIndex(int newIndex){
    index = newIndex;
    if(index==1)
      getUsername();
  }
  void getUsername() async{
    final result = await appStorage.getLoggedInUsername();
    username = result.toString();
  }

  void logout(){
    appStorage.logOut();
  }
}