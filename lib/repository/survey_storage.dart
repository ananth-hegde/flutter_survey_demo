import '../models/local/survey_model.dart';

abstract class SurveyStorage{
  void addSurvey(Survey s);
  void syncSurveysToCloud();
  void deleteSurvey(int id);
}