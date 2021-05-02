import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_survey_demo/ui/pages/survey_second_page.dart';
import '../widgets/mandatoryTextField.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../store/survey_store.dart';
import 'survey_second_page.dart';
class SurveyFirstPage extends StatefulWidget {
  static const routeName = '/surveyFirstPage';
  @override
  _SurveyFirstPageState createState() => _SurveyFirstPageState();
}

class _SurveyFirstPageState extends State<SurveyFirstPage> {
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
        title: Text('Add Household Profile Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Observer(
                      builder: (_) => Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          MandatoryTextField(
                              store.setName,
                              'Name',
                              store.error.nameError,
                              'Name (Household Representative)'),
                          MandatoryTextField(
                              store.setHouseholdSize,
                              'Household Size',
                              store.error.householdSizeError,
                              'Total number of members in family',
                              TextInputType.number),
                          MandatoryTextField(
                              store.setAdultCount,
                              'Adult',
                              store.error.adultCountError,
                              'Total number of adult members in family',
                              TextInputType.number),
                          MandatoryTextField(
                              store.setChildCount,
                              'Children',
                              store.error.childCountError,
                              'Total number of child members in family',
                              TextInputType.number),
                          MandatoryTextField(
                              store.setPhoneNumber,
                              'Phone Number',
                              store.error.phoneNumberError,
                              'Phone Number',
                              TextInputType.number,
                              9,
                              MaxLengthEnforcement.enforced),
                          MandatoryTextField(store.setAddress, 'Address',
                              store.error.addressError, 'Enter Full Address'),
                          ElevatedButton(
                            onPressed: () {
                              if (store.validateFirstPage() == true) {
                                Navigator.pushNamed(context, SurveySecondPage.routeName);
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
            ],
          ),
        ),
      ),
    );
  }
}
