// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_try.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipes _$RecipesFromJson(Map<String, dynamic> json) => Recipes(
  success: json['success'] as bool?,
  page: (json['page'] as num?)?.toInt(),
  results: (json['results'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipesToJson(Recipes instance) => <String, dynamic>{
  'success': instance.success,
  'page': instance.page,
  'results': instance.results,
  'total': instance.total,
  'data': instance.data?.map((e) => e.toJson()).toList(),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  image: json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>),
  macros: json['macros'] == null
      ? null
      : Macros.fromJson(json['macros'] as Map<String, dynamic>),
  sId: json['_id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  mealType: json['mealType'] as String?,
  cookingTime: (json['cookingTime'] as num?)?.toInt(),
  calories: (json['calories'] as num?)?.toInt(),
  dietTags: (json['dietTags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ingredients: (json['ingredients'] as List<dynamic>?)
      ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
      .toList(),
  steps: (json['steps'] as List<dynamic>?)
      ?.map((e) => Steps.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['isActive'] as bool?,
  averageRating: (json['averageRating'] as num?)?.toInt(),
  ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
  iV: (json['iV'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  isFavorite: json['isFavorite'] as bool?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'image': instance.image?.toJson(),
  'macros': instance.macros?.toJson(),
  '_id': instance.sId,
  'name': instance.name,
  'description': instance.description,
  'mealType': instance.mealType,
  'cookingTime': instance.cookingTime,
  'calories': instance.calories,
  'dietTags': instance.dietTags,
  'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
  'steps': instance.steps?.map((e) => e.toJson()).toList(),
  'isActive': instance.isActive,
  'averageRating': instance.averageRating,
  'ratingsCount': instance.ratingsCount,
  'iV': instance.iV,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'isFavorite': instance.isFavorite,
};

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  secureUrl: json['secure_url'] as String?,
  publicId: json['public_id'] as String?,
);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'secure_url': instance.secureUrl,
  'public_id': instance.publicId,
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

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
  name: json['name'] as String?,
  quantity: json['quantity'] as String?,
  sId: json['sId'] as String?,
);

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'sId': instance.sId,
    };

Steps _$StepsFromJson(Map<String, dynamic> json) => Steps(
  order: (json['order'] as num?)?.toInt(),
  description: json['description'] as String?,
  sId: json['sId'] as String?,
);

Map<String, dynamic> _$StepsToJson(Steps instance) => <String, dynamic>{
  'order': instance.order,
  'description': instance.description,
  'sId': instance.sId,
};
