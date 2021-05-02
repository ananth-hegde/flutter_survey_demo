import 'package:flutter/material.dart';
import 'package:flutter_survey_demo/ui/pages/homepage.dart';
import '../widgets/mandatoryTextField.dart';
import '../widgets/mySwitch.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../store/survey_store.dart';

class SurveyThirdPage extends StatefulWidget {
  static const routeName = '/SurveyThirdPage';
  @override
  _SurveyThirdPageState createState() => _SurveyThirdPageState();
}

class _SurveyThirdPageState extends State<SurveyThirdPage> {
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
        title: Text('Add Fuel use for cooking'),
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
                            MySwitch('Do you Use Charcoal?', store.setUsesCharcoal),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesCharcoal,
                                child: MandatoryTextField(store.setCharcoalUsage,'Usage Quantity(kg/month or year)',store.error.charcoalUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            MySwitch('Do you Use Wood?', store.setUsesWood),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesWood,
                                child: MandatoryTextField(store.setWoodUsage,'Usage Quantity(kg/month or year)',store.error.woodUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            MySwitch('Do you Use LPG?', store.setUsesLpg),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesLpg,
                                child: MandatoryTextField(store.setLpgUsage,'Usage Quantity(kg/month or year)',store.error.lpgUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            MySwitch('Do you Use Kerosene?', store.setUsesKerosene),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesKerosene,
                                child: MandatoryTextField(store.setKeroseneUsage,'Usage Quantity(kg/month or year)',store.error.keroseneUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            MySwitch('Do you Use Coal?', store.setUsesCoal),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesCoal,
                                child: MandatoryTextField(store.setCoalUsage,'Usage Quantity(kg/month or year)',store.error.coalUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            MySwitch('Do you Use Electricity?', store.setUsesElectricity),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesElectricity,
                                child: MandatoryTextField(store.setElectricityUsage,'Usage Quantity(kg/month or year)',store.error.electricityUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            MySwitch('Do you Use Other Fuel?', store.setUsesOtherFuel),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesOtherFuel,
                                child: MandatoryTextField(store.setOtherFuelUsage,'Usage Quantity(kg/month or year)',store.error.otherFuelUsageError,'Please Enter Usage Quantity'),
                              ),
                            ),
                            Observer(
                              builder: (_)=>Visibility(
                                visible: store.usesOtherFuel,
                                child: MandatoryTextField(store.setOtherFuelName,'What is the other fuel?',store.error.otherFuelNameError,'Please enter the name'),
                              ),
                            ),
                            ElevatedButton(
                            onPressed: () {
                              if (store.validateThirdPage() == true) {
                                //TODO: Implement connectivity check and push online
                                
                                store.saveSurveyToHive();
                                Navigator.pushReplacementNamed(context, HomePage.routeName);
                                
                              } else {
                                setState(() {});
                              }
                            },
                            child: Text('Submit'),
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
