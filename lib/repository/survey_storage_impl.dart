import '../models/local/survey_model.dart';
import 'package:hive/hive.dart';
import 'survey_storage.dart';

class SurveyStorageImpl implements SurveyStorage{
  final String surveyBoxPath = 'surveys';
  void addSurvey(Survey s) async{
    final surveyBox = await Hive.openBox(surveyBoxPath);
    print(s);
    surveyBox.add(s);
  }

  void deleteSurvey(int index) async{
    final surveyBox = await Hive.openBox(surveyBoxPath);
    surveyBox.deleteAt(index);
  }

  void syncSurveysToCloud() async{
    final surveyBox = await Hive.openBox(surveyBoxPath);
    var i=0;
    for(Survey s in surveyBox.values){
      //TODO: synchronize data to cloud
      print(s.name);
      deleteSurvey(i++);
    }
  }
}