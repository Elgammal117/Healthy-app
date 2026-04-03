// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Getmealbydate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMealByDateRespons _$GetMealByDateResponsFromJson(
  Map<String, dynamic> json,
) => GetMealByDateRespons(
  success: json['success'] as bool?,
  results: (json['results'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetMealByDateResponsToJson(
  GetMealByDateRespons instance,
) => <String, dynamic>{
  'success': instance.success,
  'results': instance.results,
  'data': instance.data?.map((e) => e.toJson()).toList(),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  macros: json['macros'] == null
      ? null
      : Macros.fromJson(json['macros'] as Map<String, dynamic>),
  sId: json['sId'] as String?,
  userId: json['userId'] as String?,
  recipeId: json['recipeId'] == null
      ? null
      : RecipeId.fromJson(json['recipeId'] as Map<String, dynamic>),
  mealType: json['mealType'] as String?,
  date: json['date'] as String?,
  calories: (json['calories'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  iV: (json['iV'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'macros': instance.macros?.toJson(),
  'sId': instance.sId,
  'userId': instance.userId,
  'recipeId': instance.recipeId?.toJson(),
  'mealType': instance.mealType,
  'date': instance.date,
  'calories': instance.calories,
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

RecipeId _$RecipeIdFromJson(Map<String, dynamic> json) => RecipeId(
  image: json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>),
  macros: json['macros'] == null
      ? null
      : Macros.fromJson(json['macros'] as Map<String, dynamic>),
  sId: json['sId'] as String?,
  name: json['name'] as String?,
  mealType: json['mealType'] as String?,
  calories: (json['calories'] as num?)?.toInt(),
);

Map<String, dynamic> _$RecipeIdToJson(RecipeId instance) => <String, dynamic>{
  'image': instance.image?.toJson(),
  'macros': instance.macros?.toJson(),
  'sId': instance.sId,
  'name': instance.name,
  'mealType': instance.mealType,
  'calories': instance.calories,
};

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  secureUrl: json['secure_url'] as String?,
  publicId: json['public_id'] as String?,
);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'secure_url': instance.secureUrl,
  'public_id': instance.publicId,
};
