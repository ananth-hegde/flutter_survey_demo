import 'dart:convert';

import '../models/local/survey_model.dart';
import 'package:hive/hive.dart';
import 'survey_storage.dart';
import 'package:http/http.dart' as http;
import 'apiUrls.dart';


class SurveyStorageImpl implements SurveyStorage{
  final String surveyBoxPath = 'surveys';
  ApiUrls urls = ApiUrls();
  void addSurveyToHive(Survey s) async{
    final surveyBox = await Hive.openBox(surveyBoxPath);
    print(s);
    surveyBox.add(s);
  }

  Future<Box<dynamic>> getSurveyBox() async{
    Box surveyBox;
    try{
      surveyBox = Hive.box(surveyBoxPath);
    }
    catch(e){
      surveyBox = await Hive.openBox(surveyBoxPath);
    }
    final surveyBoxInstance = Hive.box<dynamic>(surveyBoxPath);
    return surveyBoxInstance;
  }
  Future<http.Response> addSurveyToApi(Survey s) async{
    
    Map<String,dynamic> argumentBody={};
    argumentBody = s.toOnlineMap;
    var response = await http.post(urls.pushSurvey,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
    },
    body: json.encode(argumentBody));
    return response;
  }
  void deleteSurveyFromHive(int index) async{
    final surveyBox = await Hive.openBox(surveyBoxPath);
    surveyBox.deleteAt(index);
  }

  void syncSurveysToCloud() async{
    final surveyBox = await Hive.openBox(surveyBoxPath);
    var i=0;
    for(Survey s in surveyBox.values){
      var response = await addSurveyToApi(s);
      if(response.statusCode==200)
      {
        print(s.name=" synced");
        
        deleteSurveyFromHive(i++);
      }
      
    }
  }
}