import 'package:flutter_survey_demo/repository/app_storage_impl.dart';
import 'package:mobx/mobx.dart';
import '../../repository/app_storage.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store{
  final AppStorage _appStorage = AppStorageImpl();

  @action
  Future<bool> isLoggedIn() => _appStorage.isLoggedIn();

}