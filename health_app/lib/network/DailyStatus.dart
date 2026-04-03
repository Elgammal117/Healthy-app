import 'package:json_annotation/json_annotation.dart';

part 'DailyStatus.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyStatusRespons {
  bool? success;
  String? date;
  Consumed? consumed;
  Consumed? target;
  Consumed? remaining;
  Flags? flags;

  DailyStatusRespons({
    this.success,
    this.date,
    this.consumed,
    this.target,
    this.remaining,
    this.flags,
  });

  factory DailyStatusRespons.fromJson(Map<String, dynamic> json) =>
      _$DailyStatusResponsFromJson(json);
  Map<String, dynamic> toJson() => _$DailyStatusResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Consumed {
  int? calories;
  int? protein;
  int? carbohydrates;
  int? fats;

  Consumed({this.calories, this.protein, this.carbohydrates, this.fats});

  factory Consumed.fromJson(Map<String, dynamic> json) =>
      _$ConsumedFromJson(json);
  Map<String, dynamic> toJson() => _$ConsumedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Flags {
  bool? overCalories;
  bool? overProtein;
  bool? overCarbohydrates;
  bool? overFats;
  bool? noMeals;

  Flags({
    this.overCalories,
    this.overProtein,
    this.overCarbohydrates,
    this.overFats,
    this.noMeals,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}
