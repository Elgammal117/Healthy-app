// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DailyStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyStatusRespons _$DailyStatusResponsFromJson(Map<String, dynamic> json) =>
    DailyStatusRespons(
      success: json['success'] as bool?,
      date: json['date'] as String?,
      consumed: json['consumed'] == null
          ? null
          : Consumed.fromJson(json['consumed'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : Consumed.fromJson(json['target'] as Map<String, dynamic>),
      remaining: json['remaining'] == null
          ? null
          : Consumed.fromJson(json['remaining'] as Map<String, dynamic>),
      flags: json['flags'] == null
          ? null
          : Flags.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyStatusResponsToJson(DailyStatusRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'date': instance.date,
      'consumed': instance.consumed?.toJson(),
      'target': instance.target?.toJson(),
      'remaining': instance.remaining?.toJson(),
      'flags': instance.flags?.toJson(),
    };

Consumed _$ConsumedFromJson(Map<String, dynamic> json) => Consumed(
  calories: (json['calories'] as num?)?.toInt(),
  protein: (json['protein'] as num?)?.toInt(),
  carbohydrates: (json['carbohydrates'] as num?)?.toInt(),
  fats: (json['fats'] as num?)?.toInt(),
);

Map<String, dynamic> _$ConsumedToJson(Consumed instance) => <String, dynamic>{
  'calories': instance.calories,
  'protein': instance.protein,
  'carbohydrates': instance.carbohydrates,
  'fats': instance.fats,
};

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
  overCalories: json['overCalories'] as bool?,
  overProtein: json['overProtein'] as bool?,
  overCarbohydrates: json['overCarbohydrates'] as bool?,
  overFats: json['overFats'] as bool?,
  noMeals: json['noMeals'] as bool?,
);

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
  'overCalories': instance.overCalories,
  'overProtein': instance.overProtein,
  'overCarbohydrates': instance.overCarbohydrates,
  'overFats': instance.overFats,
  'noMeals': instance.noMeals,
};
