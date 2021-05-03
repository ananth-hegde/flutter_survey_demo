import 'package:flutter_survey_demo/repository/survey_storage_impl.dart';
import 'package:mobx/mobx.dart';
import '../../models/local/survey_model.dart';
import '../../repository/survey_storage.dart';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
part 'survey_store.g.dart';

class SurveyStore = _SurveyStore with _$SurveyStore;

abstract class _SurveyStore with Store{

  SurveyStorage surveyStorage = SurveyStorageImpl();

  @observable
  SurveyStoreErrorState error = SurveyStoreErrorState();
  
  @observable
  String name='';

  @observable
   String address='';

  @observable
   int householdSize=0;

  @observable
   int adultCount=-1;

  @observable
   int childCount=-1;

  @observable
  String phoneNumber='';

  @observable
  String stoveId='';

  @observable
   File? stoveImage;

  @observable
   DateTime? dateOfInstallation;

  @observable
   bool usesProjectCookstove = false;

  @observable
   String? stopUsageReason;

  @observable
   bool? usesProjectRegularly;

  @observable
   bool? stoveCondition;

  @observable
   int? numberOfProjectMeals;

  @observable
   bool usesTraditionalCookstove = false;

  @observable
   int? numberOfTraditionalMeals;

  @observable
   bool usesOtherStove = false;

  @observable
   int? numberOfOtherMeals;

  @observable
   int? numberOfDaysPerWeek;

  @observable
   File? photoOfOtherStove;

  @observable
   bool usesCharcoal = false;

  @observable
   bool usesWood = false;

  @observable
   bool usesKerosene = false;

  @observable
   bool usesLpg = false;

  @observable
   bool usesCoal = false;

  @observable
   bool usesElectricity = false;

  @observable
   bool usesOtherFuel = false;

  @observable
   String? charcoalUsage;

  @observable
   String? woodUsage;

  @observable
   String? lpgUsage;

  @observable
   String? keroseneUsage;

  @observable
   String? coalUsage;

  @observable
   String? electricityUsage;

  @observable
   String? otherFuelUsage;
  
  @observable
   String? otherFuelName;

  @observable
  bool pushStatus = true;
  @observable
  bool showStopUsageReason = true;
  _SurveyStore(){
    error = SurveyStoreErrorState();
  }
  @action
  void setName(String value)
  {
    name = value;
  }


  @action
  void resetAll(){
    name='';
    address='';
    householdSize=0;
    adultCount=-1;
    childCount=-1;
    phoneNumber='';
    stoveId='';
    stoveImage = null;
    dateOfInstallation = null;
    usesProjectCookstove = false;
    stopUsageReason = null;
    usesProjectRegularly = null;
    stoveCondition = null;
    numberOfProjectMeals = null;
    usesTraditionalCookstove = false;
    numberOfTraditionalMeals = null;
    usesOtherStove = false;
    numberOfOtherMeals = null;
    numberOfDaysPerWeek = null;
    photoOfOtherStove = null;
    usesCharcoal = false;
    usesWood = false;
    usesKerosene = false;
    usesLpg = false;
    usesCoal = false;
    usesElectricity = false;
    usesOtherFuel = false;
    charcoalUsage = null;
    woodUsage = null;
    lpgUsage = null;
    keroseneUsage = null;
    coalUsage = null;
    electricityUsage = null;
    otherFuelUsage = null;
    otherFuelName = null;
  }
  @action setUniqueStoveId(String value){
    stoveId = value;
  }
  @action 
  void setHouseholdSize(String value)
  {
    householdSize = int.parse(value);
  }

  @action
  void setAdultCount(String value)
  {
    adultCount = int.parse(value);
  }

  @action
  void setChildCount(String value)
  {
    childCount = int.parse(value);
  }

  @action
  void setPhoneNumber(String value)
  {
    phoneNumber = value;
  }

  @action
  void setAddress(String value)
  {
    address = value;
  }

  @action
  void setStoveImage(File? img){
    stoveImage = img;
    
  }

  @action
  void setDateOfInstallation(DateTime date){
    dateOfInstallation = date;
  }

  @action
  void setUsesProjectCookStove(bool newState){
    usesProjectCookstove = newState; 
    showStopUsageReason = false;
  }

  @action
  void setPhotoOfOtherStove(File img){
    photoOfOtherStove = img;
  }

  @action
  void setStopUsageReason(String reason){
    stopUsageReason = reason;
    
  }

  @action
  void setusesProjectRegularly(bool value){
    usesProjectRegularly = value;
  }
  @action
  void setStoveCondition(bool value){
    stoveCondition = value;
  }

  @action
  void setNumberOfDaysPerWeek(String value){
    numberOfDaysPerWeek = int.parse(value);
  }
  @action
  void setNumberOfProjectMeals(String value){
    numberOfProjectMeals = int.parse(value);
  }
  @action
  void setUsesTraditionCookstove(bool value){
    usesTraditionalCookstove = value;
  }

  @action
  void setNumberOfTraditionalMeals(String value){
    numberOfTraditionalMeals = int.parse(value);
  }

  @action
  void setUsesOtherStove(bool value){
    usesOtherStove = value;
  }

  @action
  void setNumberOfOtherMeals(String value){
    numberOfOtherMeals = int.parse(value);
  }

  @action
  void setUsesCharcoal(bool value){
    usesCharcoal = value;
  }

  @action
  void setUsesWood(bool value){
    usesWood = value;
  }

  @action
  void setUsesLpg(bool value){
    usesLpg = value;
  }

  @action
  void setUsesCoal(bool value){
    usesCoal = value;
  }

  @action
  void setUsesKerosene(bool value){
    usesKerosene = value;
  }

  @action
  void setUsesElectricity(bool value){
    usesElectricity = value;
  }

  @action
  void setUsesOtherFuel(bool value){
    usesOtherFuel = value;
  }

  @action
  void setCharcoalUsage(String value){
    charcoalUsage = value;
  }

  @action
  void setLpgUsage(String value){
    lpgUsage = value;
  }

  @action
  void setWoodUsage(String value){
    woodUsage = value;
  }

  @action
  void setKeroseneUsage(String value){
    keroseneUsage = value;
  }

  @action
  void setCoalUsage(String value){
    coalUsage = value;
  }

  @action
  void setElectricityUsage(String value){
    electricityUsage = value;
  }

  @action
  void setOtherFuelUsage(String value){
    otherFuelUsage = value;
  }

  @action
  void setOtherFuelName(String value){
    otherFuelName = value;
  }


  @action
  bool validateFirstPage(){
    error = SurveyStoreErrorState();
    error.validateName(name);
    error.validateHouseholdSize(householdSize);
    error.validateAdultCount(adultCount);
    error.validateChildCount(childCount);
    error.validateAdultAndChildCount(adultCount,childCount,householdSize);
    error.validatePhoneNumber(phoneNumber);
    error.validateAddress(address);
    return error.hasNoErrors();
  }

  @action
  bool validateSecondPage(){
    error = SurveyStoreErrorState();
    error.validateStoveId(stoveId);
    error.validateStoveImage(stoveImage);
    error.validateDateOfInstallation(dateOfInstallation);
    if(usesProjectCookstove==false){
      error.validateStopUsageReason(stopUsageReason);
    }
    else{
      error.validateNumberOfProjectMeals(numberOfProjectMeals);
      error.validateNumberOfDaysPerWeek(numberOfDaysPerWeek);
    }
    if(usesTraditionalCookstove==true){
      error.validateNumberOfTraditionalMeals(numberOfTraditionalMeals);
      
    }
    if(usesOtherStove==true){
      error.validateNumberOfOtherMeals(numberOfOtherMeals);
      error.validatePhotoOfOtherStove(photoOfOtherStove);
    }
    return error.hasNoErrors();
  }

  @action
  bool validateThirdPage(){
    if(usesCharcoal)
      error.validateCharcoalUsage(charcoalUsage);
    if(usesWood)
      error.validateWoodUsage(woodUsage);
    if(usesLpg)
      error.validateLpgUsage(lpgUsage);
    if(usesKerosene)
      error.validateKeroseneUsage(keroseneUsage);
    if(usesCoal)
      error.validateCoalUsage(coalUsage);
    if(usesElectricity)
      error.validateElectricityUsage(electricityUsage);
    if(usesOtherFuel)
    {
      error.validateOtherFuelName(otherFuelName);
      error.validateOtherFuelUsage(otherFuelUsage);
    }
    return error.hasNoErrors();
  }

  @action
  void saveSurveyToHive(Survey s){
    surveyStorage.addSurveyToHive(s);
  }

  @action
  Future<bool> pushSurveyToCloud(Survey s) async{
    http.Response pushResult = await surveyStorage.addSurveyToApi(s);
    print(pushResult.statusCode);
    print(pushResult.body);
    if(pushResult.statusCode!=200)
    {
      return false;
    }
    return true;
  }

  @action
  Future<void> checkConnectionAndProceed() async{
    
    DateTime installDate = dateOfInstallation??DateTime.now();
    bool result = await DataConnectionChecker().hasConnection;
    Survey s = Survey(name, householdSize, adultCount, childCount, phoneNumber, address, stoveId, stoveImage?.path, DateFormat('dd-MMMM-YYYY').format(installDate).toString(), usesProjectCookstove, usesProjectRegularly, stopUsageReason, stoveCondition, numberOfProjectMeals, usesTraditionalCookstove, numberOfTraditionalMeals, usesOtherStove, numberOfOtherMeals, numberOfDaysPerWeek, photoOfOtherStove?.path.toString(), usesCharcoal, usesWood, usesLpg, usesKerosene, usesCoal, usesElectricity, usesOtherFuel, charcoalUsage, woodUsage, lpgUsage, keroseneUsage, coalUsage, electricityUsage, otherFuelUsage, otherFuelName);
    if(result == true)
    {
      if(await pushSurveyToCloud(s)) {}
      else{
        saveSurveyToHive(s);
        pushStatus = false;
      }
      
    }
    else{
      saveSurveyToHive(s);
    }
  }
}


class SurveyStoreErrorState with Store{
  @observable
  String? nameError;
  @observable
  String? householdSizeError;
  @observable
  String? adultCountError;
  @observable
  String? childCountError;
  @observable
  String? phoneNumberError;
  @observable
  String? addressError;
  @observable
  String? stoveIdError;
  @observable
  String? stoveImageError;
  @observable
  String? stopUsageReasonError;
  @observable
  String? dateOfInstallationError;
  @observable
  String? numberOfProjectMealsError;
  @observable
  String? numberOfDaysPerWeekError;
  @observable
  String? numberOfTraditionalMealsError;
  @observable
  String? numberOfOtherMealsError;
  @observable
  String? photoOfOtherStoveError;
  @observable
  String? charcoalUsageError;
  @observable
  String? woodUsageError;
  @observable
  String? lpgUsageError;
  @observable
  String? keroseneUsageError;
  @observable
  String? coalUsageError;
  @observable
  String? electricityUsageError;
  @observable
  String? otherFuelUsageError;
  @observable
  String? otherFuelNameError;
  
  void validateName(String name){
    
    if(name==''||name.isEmpty){
      nameError = 'Please Enter the house representative name';
      return;
    }
    print("Name: "+name);
    nameError = null; 
    
  }

  @action
  void validateHouseholdSize(int? hSize){
    if(hSize==null){
      householdSizeError = 'Please Enter the total number of people';
      return;
    }
    if(hSize<=0){
      householdSizeError = 'Please Enter the total number of people';
      return;
    }
    householdSizeError = null;
  }

  @action
  void validateAdultCount(int? aCount){
    if(aCount==null){
      adultCountError = 'Please Enter number of adults';
      return;
    }
    if(aCount<0){
      adultCountError = 'Please Enter number of adults';
      return;
    }
    adultCountError = null;
  }

  @action
  void validateChildCount(int? cCount)
  {
    if(cCount==null){
      childCountError = 'Please Enter number of children';
      return;
    }
    if(cCount<0){
      childCountError = 'Please Enter number of children';
      return;
    }
    childCountError = null;
  }

  @action
  void validateAdultAndChildCount(int aCount, int cCount, int hSize)
  {
    if(householdSizeError==null&&adultCountError==null&&childCountError==null){
      
      if(aCount+cCount!=hSize)
      {
        householdSizeError = adultCountError = childCountError = "Total number of adults and children not equal to total household size";
        return;
      }
    }
  }
  @action
  void validatePhoneNumber(String phoneNumber){
    if(phoneNumber.length!=9)
    {
      phoneNumberError = "Please enter a valid 9 digit phone number";
      return;
    }
    phoneNumberError = null;
  }
  @action
  void validateAddress(String address){
    if(address.isEmpty||address==''){
      addressError = 'Please enter your address';
      return;
    }
    addressError = null;
  }

  @action
  void validateStoveId(String? stoveId){
    if(stoveId==null||stoveId==''||stoveId.isEmpty)
    {
      stoveIdError = 'Please enter valid stove ID';
      
      return;
    }
    stoveIdError = null;
  }

  @action
  void validateStoveImage(File? img){
    if(img == null){
      stoveImageError = 'Please Select valid Stove image';
      //print(stoveImageError.toString());
      return;
    }
    stoveImageError = null;
  }

  @action
  void validateDateOfInstallation(DateTime? date){
    print(date);
    if(date==null)
    {
      dateOfInstallationError = 'Please Enter Date of Installation';
      return;
    }
    dateOfInstallationError = null;
  }

  @action
  void validateStopUsageReason(String? reason){
    if(reason==null||reason==''||reason.isEmpty){
      stopUsageReasonError = 'Please enter the reason you stopped using the cookstove';
      return;
    }
    stopUsageReasonError = null;
  }

  @action
  void validateNumberOfProjectMeals(int? n){
    if(n==null||n<=0)
    {
      numberOfProjectMealsError = 'Please enter a valid (positive) number of meals';
      return;
    }
    numberOfProjectMealsError = null;
  }

  @action
  void validateNumberOfDaysPerWeek(int? n){
    if(n==null||n<=0||n>7)
    {
      numberOfDaysPerWeekError = 'Please enter a valid (between 1 and 7) number of days ';
      return;
    }
    numberOfDaysPerWeekError = null;
  }

  @action
  void validateNumberOfTraditionalMeals(int? n){
    if(n==null||n<=0)
    {
      numberOfTraditionalMealsError = 'Please enter a valid (positive) number of meals';
      return;
    }
    numberOfTraditionalMealsError = null;
  }

  @action
  void validateNumberOfOtherMeals(int? n){
    if(n==null||n<=0)
    {
      numberOfOtherMealsError = 'Please enter a valid (positive) number of meals';
      return;
    }
    numberOfOtherMealsError = null;
  }

  @action
  void validatePhotoOfOtherStove(File? img){
    if(img == null){
      photoOfOtherStoveError = 'Please Select valid Stove image';
      //print(stoveImageError.toString());
      return;
    }
    photoOfOtherStoveError = null;
  }
  @action
  void validateCharcoalUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      charcoalUsageError = 'Please enter amount used';
      return;
    }
    charcoalUsageError = null;
  }

  @action
  void validateWoodUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      woodUsageError = 'Please enter amount used';
      return;
    }
    woodUsageError = null;
  }

  @action
  void validateLpgUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      lpgUsageError = 'Please enter amount used';
      return;
    }
    lpgUsageError = null;
  }

  @action
  void validateKeroseneUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      keroseneUsageError = 'Please enter amount used';
      return;
    }
    keroseneUsageError = null;
  }

  @action
  void validateCoalUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      coalUsageError = 'Please enter amount used';
      return;
    }
    coalUsageError = null;
  }

  @action
  void validateElectricityUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      electricityUsageError = 'Please enter amount used';
      return;
    }
    electricityUsageError = null;
  }

  @action
  void validateOtherFuelUsage(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      otherFuelUsageError = 'Please enter amount used';
      return;
    }
    otherFuelUsageError = null;
  }

  @action
  void validateOtherFuelName(String? value){
    if(value==null||value==''||value.isEmpty)
    {
      otherFuelNameError = 'Please enter Other Fuel Name';
      return;
    }
    otherFuelNameError = null;
  }


  @computed
  bool hasNoErrors() => nameError==null
                      &&householdSizeError==null
                      &&adultCountError==null
                      &&childCountError==null
                      &&phoneNumberError==null
                      &&addressError==null
                      &&stoveIdError==null
                      &&stoveImageError==null
                      &&stopUsageReasonError==null
                      &&dateOfInstallationError==null
                      &&numberOfProjectMealsError==null
                      &&numberOfDaysPerWeekError==null
                      &&numberOfTraditionalMealsError==null
                      &&numberOfOtherMealsError==null
                      &&photoOfOtherStoveError==null
                      &&charcoalUsageError==null
                      &&woodUsageError==null
                      &&lpgUsageError==null
                      &&keroseneUsageError==null
                      &&coalUsageError==null
                      &&electricityUsageError==null
                      &&otherFuelUsageError==null
                      &&otherFuelNameError==null;
}