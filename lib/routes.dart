import 'package:flutter/material.dart';
import 'ui/pages/loginpage.dart';
import 'ui/pages/homepage.dart';
import 'ui/pages/survey_first_page.dart';
import 'ui/pages/survey_second_page.dart';
import 'ui/pages/survey_third_page.dart';
import 'ui/pages/unsynced_surveys_page.dart';
Map<String, Widget Function(BuildContext)> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  HomePage.routeName: (context) => HomePage(),
  SurveyFirstPage.routeName: (context) => SurveyFirstPage(),
  SurveySecondPage.routeName: (context) => SurveySecondPage(),
  SurveyThirdPage.routeName: (context) => SurveyThirdPage(),
  UnsyncedSurveyPage.routeName: (context) => UnsyncedSurveyPage(),
};