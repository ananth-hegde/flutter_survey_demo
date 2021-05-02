// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyAdapter extends TypeAdapter<Survey> {
  @override
  final int typeId = 2;

  @override
  Survey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Survey(
      fields[0] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as String,
      fields[1] as String,
      fields[6] as String,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as bool,
      fields[11] as bool?,
      fields[10] as String?,
      fields[12] as bool?,
      fields[13] as int?,
      fields[14] as bool,
      fields[15] as int?,
      fields[16] as bool,
      fields[17] as int?,
      fields[18] as int?,
      fields[19] as String?,
      fields[20] as bool,
      fields[21] as bool,
      fields[23] as bool,
      fields[22] as bool,
      fields[24] as bool,
      fields[25] as bool,
      fields[26] as bool,
      fields[27] as String?,
      fields[28] as String?,
      fields[29] as String?,
      fields[30] as String?,
      fields[31] as String?,
      fields[32] as String?,
      fields[33] as String?,
      fields[34] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Survey obj) {
    writer
      ..writeByte(35)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.householdSize)
      ..writeByte(3)
      ..write(obj.adultCount)
      ..writeByte(4)
      ..write(obj.childCount)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.stoveId)
      ..writeByte(7)
      ..write(obj.stoveImage)
      ..writeByte(8)
      ..write(obj.dateOfInstallation)
      ..writeByte(9)
      ..write(obj.usesProjectCookstove)
      ..writeByte(10)
      ..write(obj.stopUsageReason)
      ..writeByte(11)
      ..write(obj.usesProjectRegularly)
      ..writeByte(12)
      ..write(obj.stoveCondition)
      ..writeByte(13)
      ..write(obj.numberOfProjectMeals)
      ..writeByte(14)
      ..write(obj.usesTraditionalCookstove)
      ..writeByte(15)
      ..write(obj.numberOfTraditionalMeals)
      ..writeByte(16)
      ..write(obj.usesOtherStove)
      ..writeByte(17)
      ..write(obj.numberOfOtherMeals)
      ..writeByte(18)
      ..write(obj.numberOfDaysPerWeek)
      ..writeByte(19)
      ..write(obj.photoOfOtherStove)
      ..writeByte(20)
      ..write(obj.usesCharcoal)
      ..writeByte(21)
      ..write(obj.usesWood)
      ..writeByte(22)
      ..write(obj.usesKerosene)
      ..writeByte(23)
      ..write(obj.usesLpg)
      ..writeByte(24)
      ..write(obj.usesCoal)
      ..writeByte(25)
      ..write(obj.usesElectricity)
      ..writeByte(26)
      ..write(obj.usesOtherFuel)
      ..writeByte(27)
      ..write(obj.charcoalUsage)
      ..writeByte(28)
      ..write(obj.woodUsage)
      ..writeByte(29)
      ..write(obj.lpgUsage)
      ..writeByte(30)
      ..write(obj.keroseneUsage)
      ..writeByte(31)
      ..write(obj.coalUsage)
      ..writeByte(32)
      ..write(obj.electricityUsage)
      ..writeByte(33)
      ..write(obj.otherFuelUsage)
      ..writeByte(34)
      ..write(obj.otherFuelName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
