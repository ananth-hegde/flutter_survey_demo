import 'package:flutter/material.dart';
import 'app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

import 'ui/store/survey_store.dart';
import 'models/local/user_model.dart';
import 'models/app_model.dart';
import 'models/local/survey_model.dart';
import 'ui/store/app_store.dart';
void main() async{
  await Hive.initFlutter();
  registerAdapters();
  registerSingletons();
  AppStore appStore = AppStore();
  bool isLogged = await appStore.isLoggedIn();
  runApp(MyApp(isLogged));
}

void registerAdapters(){
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AppModelAdapter());
  Hive.registerAdapter(SurveyAdapter());
}

void registerSingletons(){
  GetIt.I.registerSingleton<SurveyStore>(SurveyStore());
}