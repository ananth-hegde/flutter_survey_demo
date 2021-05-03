import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_survey_demo/repository/survey_storage.dart';
import '../../repository/survey_storage_impl.dart';
import '../../models/local/survey_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class UnsyncedSurveyPage extends StatefulWidget {
  static const routeName = '/unsyncedSurveyPage';
  @override
  _UnsyncedSurveyPageState createState() => _UnsyncedSurveyPageState();
}

class _UnsyncedSurveyPageState extends State<UnsyncedSurveyPage> {
  
  SurveyStorage surveyStorage = SurveyStorageImpl();
  late Box<dynamic> surveyBox;
  @override
  void initState(){
    
    _getSurveyBox().whenComplete(() {
      setState(() {

            });
    });
    super.initState();
  }
  Future<void> _getSurveyBox() async{
    SurveyStorage surveyStorage = SurveyStorageImpl();
    surveyBox = await surveyStorage.getSurveyBox();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unsynced Surveys'),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: (){
              surveyStorage.syncSurveysToCloud();
            }
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: surveyBox.listenable(),
        builder: (context, Box<dynamic> box, _){
          if(box.values.isEmpty)
          return Center(
                child: Text("No Unsynced Surveys"),
          );
          return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Survey currentSurvey = box.getAt(index);
                return Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Card(
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name: ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(currentSurvey.name),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Phone Number: ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(currentSurvey.phoneNumber),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
      ),
    );
  }
}