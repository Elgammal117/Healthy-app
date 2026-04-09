library;

import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProfile {
  bool? success;
  Data? data;

  GetProfile({this.success, this.data});

  factory GetProfile.fromJson(Map<String, dynamic> json) =>
      _$GetProfileFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Macros? macros;
  String? sId;
  String? userId;
  int? iV;
  String? activityLevel;
  int? age;
  String? createdAt;
  int? dailyCalories;
  String? gender;
  String? goal;
  int? height;
  String? updatedAt;
  int? weight;

  Data({
    this.macros,
    this.sId,
    this.userId,
    this.iV,
    this.activityLevel,
    this.age,
    this.createdAt,
    this.dailyCalories,
    this.gender,
    this.goal,
    this.height,
    this.updatedAt,
    this.weight,
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
