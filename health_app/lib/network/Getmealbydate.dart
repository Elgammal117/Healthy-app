import 'package:json_annotation/json_annotation.dart';

part 'Getmealbydate.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMealByDateRespons {
  bool? success;
  int? results;
  List<Data>? data;

  GetMealByDateRespons({this.success, this.results, this.data});

  factory GetMealByDateRespons.fromJson(Map<String, dynamic> json) =>
      _$GetMealByDateResponsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMealByDateResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Macros? macros;
  String? sId;
  String? userId;
  RecipeId? recipeId;
  String? mealType;
  String? date;
  int? calories;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data({
    this.macros,
    this.sId,
    this.userId,
    this.recipeId,
    this.mealType,
    this.date,
    this.calories,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Macros {
  int? protein;
  int? carbohydrates;
  int? fats;

  Macros({this.protein, this.carbohydrates, this.fats});

  factory Macros.fromJson(Map<String, dynamic> json) => _$MacrosFromJson(json);

  Map<String, dynamic> toJson() => _$MacrosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RecipeId {
  Image? image;
  Macros? macros;
  String? sId;
  String? name;
  String? mealType;
  int? calories;

  RecipeId({
    this.image,
    this.macros,
    this.sId,
    this.name,
    this.mealType,
    this.calories,
  });

  factory RecipeId.fromJson(Map<String, dynamic> json) =>
      _$RecipeIdFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIdToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Image {
  @JsonKey(name: 'secure_url')
  String? secureUrl;

  @JsonKey(name: 'public_id')
  String? publicId;

  Image({this.secureUrl, this.publicId});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
