import 'package:json_annotation/json_annotation.dart';

part 'AddMeal.g.dart';

@JsonSerializable(explicitToJson: true)
class AddMealRequest {
  String? recipeId;
  String? date;

  AddMealRequest({this.recipeId, this.date});

  factory AddMealRequest.fromJson(Map<String, dynamic> json) =>
      _$AddMealRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddMealRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddMealRespons {
  bool? success;
  String? message;
  Data? data;

  AddMealRespons({this.success, this.message, this.data});

  factory AddMealRespons.fromJson(Map<String, dynamic> json) =>
      _$AddMealResponsFromJson(json);
  Map<String, dynamic> toJson() => _$AddMealResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  String? userId;
  String? recipeId;
  String? mealType;
  String? date;
  int? calories;
  Macros? macros;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data({
    this.userId,
    this.recipeId,
    this.mealType,
    this.date,
    this.calories,
    this.macros,
    this.sId,
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
