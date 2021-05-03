import 'package:flutter/material.dart';
import '../widgets/imagePicker.dart';
import '../widgets/mandatoryTextField.dart';
import '../widgets/datePicker.dart';
import '../widgets/mySwitch.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../store/survey_store.dart';
import 'survey_third_page.dart';
class SurveySecondPage extends StatefulWidget {
  static const routeName = '/surveySecondPage';
  @override
  _SurveySecondPageState createState() => _SurveySecondPageState();
}

class _SurveySecondPageState extends State<SurveySecondPage> {
  late SurveyStore store;
  @override
  void didChangeDependencies() {
    store = GetIt.I.get<SurveyStore>();

    store.error = SurveyStoreErrorState();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stove Consumption Pattern'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Observer(
                        builder: (_) => Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            MandatoryTextField(
                              store.setUniqueStoveId,
                              'Unique Stove ID',
                              store.error.stoveIdError,
                              'Enter Unique Stove ID',
                            ),
                            MyImagePicker(
                                'Photo of stove with ID clearly visible',
                                store.setStoveImage,
                            ),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.error.stoveImageError!=null,
                                child: Center(
                                  child: Text(
                                    'Please Select a Stove Image',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            MyDatePicker(
                              'Date of Installation',
                              store.setDateOfInstallation,
                            ),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.error.dateOfInstallationError!=null,
                                child: Center(
                                  child: Text(
                                    'Please Select Installation Date',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            MySwitch('Do you use the project cookstove?',store.setUsesProjectCookStove),

                            Observer(builder: (_)=>Visibility(
                              visible: !(store.usesProjectCookstove),
                              child: MandatoryTextField(store.setStopUsageReason, 'Why did you stop using the stove?', store.error.stopUsageReasonError, 'Please Enter the reason'),
                              )
                            ),

                             Observer(builder: (_)=>Visibility(
                              visible: (store.usesProjectCookstove),
                              child: MySwitch('Have you used the stove regularly since you installed it?',store.setusesProjectRegularly),
                              )
                            ),
                            Observer(builder: (_)=>Visibility(
                              visible: (store.usesProjectCookstove),
                              child: MySwitch('Is your stove in good condition?',store.setStoveCondition),
                              )
                            ),
                            Observer(builder: (_)=>Visibility(
                              visible: (store.usesProjectCookstove),
                              child: MandatoryTextField(store.setNumberOfProjectMeals,'Total Number of meals cooked per week?',store.error.numberOfProjectMealsError,'Please enter the total number',TextInputType.number),
                              )
                            ),
                            Observer(builder: (_)=>Visibility(
                              visible: (store.usesProjectCookstove),
                              child: Column(
                                children: [
                                  Text('How many days did you prepare using project cookstove per week?'),
                                  MandatoryTextField(store.setNumberOfDaysPerWeek,'',store.error.numberOfDaysPerWeekError,'Please enter the total number',TextInputType.number),
                                ]
                              )
                              ),
                            ),
                            MySwitch('Do you use traditional(baseline) cookstove also?',store.setUsesTraditionCookstove),
                            Observer(builder: (_)=>Visibility(
                              visible: (store.usesTraditionalCookstove),
                              child: Column(
                                children: [
                                  Text('How many meals did you prepare using traditional cookstove per week?'),
                                  MandatoryTextField(store.setNumberOfTraditionalMeals,'',store.error.numberOfTraditionalMealsError,'Please enter the total number',TextInputType.number),
                                ]
                              )
                              ),
                            ),
                            MySwitch('Do you use any other stove?(e.g. ICS, gas, coal, kerosene, other)',store.setUsesOtherStove),
                            Observer(builder: (_)=>Visibility(
                              visible: (store.usesOtherStove),
                              child: Column(
                                children: [
                                  Text('How many meals did you prepare using Other cookstove per week?'),
                                  MandatoryTextField(store.setNumberOfOtherMeals,'',store.error.numberOfOtherMealsError,'Please enter the total number',TextInputType.number),
                                ]
                              )
                              ),
                            ),
                            Observer(builder: (_)=>Visibility(
                              visible: (store.usesOtherStove),
                              child: MyImagePicker('Photo of the other stove',store.setPhotoOfOtherStove),
                              )
                            ),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.error.photoOfOtherStoveError!=null,
                                child: Center(
                                  child: Text(
                                    'Please Select a Stove Image',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                            onPressed: () {
                              if (store.validateSecondPage() == true) {
                                
                                Navigator.pushNamed(context, SurveyThirdPage.routeName);
                                
                              } else {
                                setState(() {});
                              }
                            },
                            child: Text('Next'),
                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
