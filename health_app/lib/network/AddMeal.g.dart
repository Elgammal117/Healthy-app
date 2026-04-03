// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddMeal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMealRequest _$AddMealRequestFromJson(Map<String, dynamic> json) =>
    AddMealRequest(
      recipeId: json['recipeId'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$AddMealRequestToJson(AddMealRequest instance) =>
    <String, dynamic>{'recipeId': instance.recipeId, 'date': instance.date};

AddMealRespons _$AddMealResponsFromJson(Map<String, dynamic> json) =>
    AddMealRespons(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddMealResponsToJson(AddMealRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  userId: json['userId'] as String?,
  recipeId: json['recipeId'] as String?,
  mealType: json['mealType'] as String?,
  date: json['date'] as String?,
  calories: (json['calories'] as num?)?.toInt(),
  macros: json['macros'] == null
      ? null
      : Macros.fromJson(json['macros'] as Map<String, dynamic>),
  sId: json['sId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  iV: (json['iV'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'userId': instance.userId,
  'recipeId': instance.recipeId,
  'mealType': instance.mealType,
  'date': instance.date,
  'calories': instance.calories,
  'macros': instance.macros?.toJson(),
  'sId': instance.sId,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'iV': instance.iV,
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
