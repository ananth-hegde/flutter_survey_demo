import 'package:hive/hive.dart';
import 'dart:io';
part 'survey_model.g.dart';

@HiveType(typeId: 2)
class Survey extends HiveObject{
  Survey(
    this.name,
    this.householdSize,
    this.adultCount,
    this.childCount,
    this.phoneNumber,
    this.address,
    this.stoveId,
    this.stoveImage,
    this.dateOfInstallation,
    this.usesProjectCookstove,
    this.usesProjectRegularly,
    this.stopUsageReason,
    this.stoveCondition,
    this.numberOfProjectMeals,
    this.usesTraditionalCookstove,
    this.numberOfTraditionalMeals,
    this.usesOtherStove,
    this.numberOfOtherMeals,
    this.numberOfDaysPerWeek,
    this.photoOfOtherStove,
    this.usesCharcoal,
    this.usesWood,
    this.usesLpg,
    this.usesKerosene,
    this.usesCoal,
    this.usesElectricity,
    this.usesOtherFuel,
    this.charcoalUsage,
    this.woodUsage,
    this.lpgUsage,
    this.keroseneUsage,
    this.coalUsage,
    this.electricityUsage,
    this.otherFuelUsage,
    this.otherFuelName,
  );
  @override
  String toString(){
    return this.name+
    this.householdSize.toString()+
    this.adultCount.toString()+"\n"+
    this.childCount.toString()+"\n"+
    this.phoneNumber.toString()+"\n"+
    this.address+"\n"+
    this.stoveId+"\n"+
    this.stoveImage.toString()+"\n"+
    this.dateOfInstallation.toString()+"\n"+
    this.usesProjectCookstove.toString()+"\n"+
    this.usesProjectRegularly.toString()+"\n"+
    this.stopUsageReason.toString()+"\n"+
    this.stoveCondition.toString()+"\n"+
    this.numberOfProjectMeals.toString()+"\n"+
    this.usesTraditionalCookstove.toString()+"\n"+
    this.numberOfTraditionalMeals.toString()+"\n"+
    this.usesOtherStove.toString()+"\n"+
    this.numberOfOtherMeals.toString()+"\n"+
    this.numberOfDaysPerWeek.toString()+"\n"+
    this.photoOfOtherStove.toString()+"\n"+
    this.usesCharcoal.toString()+"\n"+
    this.usesWood.toString()+"\n"+
    this.usesLpg.toString()+"\n"+
    this.usesKerosene.toString()+"\n"+
    this.usesCoal.toString()+"\n"+
    this.usesElectricity.toString()+"\n"+
    this.usesOtherFuel.toString()+"\n"+
    this.charcoalUsage.toString()+"\n"+
    this.woodUsage.toString()+"\n"+
    this.lpgUsage.toString()+"\n"+
    this.keroseneUsage.toString()+"\n"+
    this.coalUsage.toString()+"\n"+
    this.electricityUsage.toString()+"\n"+
    this.otherFuelUsage.toString()+"\n"+
    this.otherFuelName.toString()+"\n";
  }

  Map<String,dynamic>get toOnlineMap{
    var map = {
      'name': name,
      'address':address,
      'householdSize':householdSize,
      'adultCount':adultCount,
      'childCount':childCount,
      'phoneNumber':phoneNumber,
      'stoveId':stoveId,
      'stoveImage': stoveImage,
      'dateOfInstallation':dateOfInstallation,
      'usesProjectCookstove':usesProjectCookstove,
      'stopUsageReason':stopUsageReason,
      'usesProjectRegularly':usesProjectRegularly,
      'stoveCondition':stoveCondition,
      'numberOfProjectMeals':numberOfProjectMeals,
      'usesTraditionalCookstove':usesTraditionalCookstove,
      'numberOfTraditionalMeals':numberOfTraditionalMeals,
      'usesOtherStove':usesOtherStove,
      'numberOfOtherMeals':numberOfOtherMeals,
      'numberOfDaysPerWeek':numberOfDaysPerWeek,
      'photoOfOtherStove':photoOfOtherStove,
      'usesCharcoal':usesCharcoal,
      'usesWood':usesWood,
      'usesKerosene':usesKerosene,
      'usesLpg':usesLpg,
      'usesCoal':usesCoal,
      'usesElectricity':usesElectricity,
      'usesOtherFuel':usesOtherFuel,
      'charcoalUsage':charcoalUsage,
      'woodUsage':woodUsage,
      'lpgUsage':lpgUsage,
      'keroseneUsage':keroseneUsage,
      'coalUsage':coalUsage,
      'electricityUsage':electricityUsage,
      'otherFuelUsage':otherFuelUsage,
    };
    print(map);
    return map;
  }
  @HiveField(0)
  String name='';

  @HiveField(1)
   String address='';

  @HiveField(2)
   int householdSize=0;

  @HiveField(3)
   int adultCount=-1;

  @HiveField(4)
   int childCount=-1;

  @HiveField(5)
  String phoneNumber='';

  @HiveField(6)
  String stoveId='';

  @HiveField(7)
  String? stoveImage;

  @HiveField(8)
   String? dateOfInstallation;

  @HiveField(9)
   bool usesProjectCookstove = false;

  @HiveField(10)
   String? stopUsageReason;

  @HiveField(11)
   bool? usesProjectRegularly;

  @HiveField(12)
   bool? stoveCondition;

  @HiveField(13)
   int? numberOfProjectMeals;

  @HiveField(14)
   bool usesTraditionalCookstove = false;

  @HiveField(15)
   int? numberOfTraditionalMeals;

  @HiveField(16)
   bool usesOtherStove = false;

  @HiveField(17)
   int? numberOfOtherMeals;

  @HiveField(18)
   int? numberOfDaysPerWeek;

  @HiveField(19)
   String? photoOfOtherStove;

  @HiveField(20)
   bool usesCharcoal = false;

  @HiveField(21)
   bool usesWood = false;

  @HiveField(22)
   bool usesKerosene = false;

  @HiveField(23)
   bool usesLpg = false;

  @HiveField(24)
   bool usesCoal = false;

  @HiveField(25)
   bool usesElectricity = false;

  @HiveField(26)
   bool usesOtherFuel = false;

  @HiveField(27)
   String? charcoalUsage;

  @HiveField(28)
   String? woodUsage;

  @HiveField(29)
   String? lpgUsage;

  @HiveField(30)
   String? keroseneUsage;

  @HiveField(31)
   String? coalUsage;

  @HiveField(32)
   String? electricityUsage;

  @HiveField(33)
   String? otherFuelUsage;
  
  @HiveField(34)
   String? otherFuelName;
}