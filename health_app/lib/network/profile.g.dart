// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfile _$GetProfileFromJson(Map<String, dynamic> json) => GetProfile(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetProfileToJson(GetProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  macros: json['macros'] == null
      ? null
      : Macros.fromJson(json['macros'] as Map<String, dynamic>),
  sId: json['sId'] as String?,
  userId: json['userId'] as String?,
  iV: (json['iV'] as num?)?.toInt(),
  activityLevel: json['activityLevel'] as String?,
  age: (json['age'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  dailyCalories: (json['dailyCalories'] as num?)?.toInt(),
  gender: json['gender'] as String?,
  goal: json['goal'] as String?,
  height: (json['height'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'macros': instance.macros?.toJson(),
  'sId': instance.sId,
  'userId': instance.userId,
  'iV': instance.iV,
  'activityLevel': instance.activityLevel,
  'age': instance.age,
  'createdAt': instance.createdAt,
  'dailyCalories': instance.dailyCalories,
  'gender': instance.gender,
  'goal': instance.goal,
  'height': instance.height,
  'updatedAt': instance.updatedAt,
  'weight': instance.weight,
};

Macros _$MacrosFromJson(Map<String, dynamic> json) => Macros(
  protein: (json['protein'] as num?)?.toInt(),
  carbohydrates: (json['carbohydrates'] as num?)?.toInt(),
  fats: (json['fats'] as num?)?.toInt(),
);

Map<String, dynamic> _$MacrosToJson(Macros instance) => <String, dynamic>{
  'protein': instance.protein,
  'carbohydrates': instance.carbohydrates,
  'fats': instance.fats,
};
