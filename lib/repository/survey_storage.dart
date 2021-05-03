import '../models/local/survey_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
abstract class SurveyStorage{
  void addSurveyToHive(Survey s);
  void syncSurveysToCloud();
  void deleteSurveyFromHive(int index);
  Future<http.Response> addSurveyToApi(Survey s);
  Future<Box<dynamic>> getSurveyBox();
}