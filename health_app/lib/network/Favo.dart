import 'package:json_annotation/json_annotation.dart';
part 'Favo.g.dart';

@JsonSerializable(explicitToJson: true)
class Favo {
  bool? success;
  int? results;
  List<Data>? data;

  Favo({this.success, this.results, this.data});
  factory Favo.fromJson(Map<String, dynamic> json) => _$FavoFromJson(json);
  Map<String, dynamic> toJson() => _$FavoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Image? image;
  Macros? macros;
  String? sId;
  String? name;
  String? description;
  String? mealType;
  int? cookingTime;
  int? calories;
  List<String>? dietTags;
  List<Ingredients>? ingredients;
  List<Steps>? steps;
  bool? isActive;
  int? averageRating;
  int? ratingsCount;
  int? iV;
  String? createdAt;
  String? updatedAt;
  bool? isFavorite;

  Data({
    this.image,
    this.macros,
    this.sId,
    this.name,
    this.description,
    this.mealType,
    this.cookingTime,
    this.calories,
    this.dietTags,
    this.ingredients,
    this.steps,
    this.isActive,
    this.averageRating,
    this.ratingsCount,
    this.iV,
    this.createdAt,
    this.updatedAt,
    this.isFavorite,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
class Ingredients {
  String? name;
  String? quantity;
  String? sId;

  Ingredients({this.name, this.quantity, this.sId});

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Steps {
  int? order;
  String? description;
  String? sId;

  Steps({this.order, this.description, this.sId});

  factory Steps.fromJson(Map<String, dynamic> json) => _$StepsFromJson(json);

  Map<String, dynamic> toJson() => _$StepsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddRecipeToFavorite {
  bool? success;
  String? message;
  bool? isFavorite;

  AddRecipeToFavorite({this.success, this.message, this.isFavorite});

  factory AddRecipeToFavorite.fromJson(Map<String, dynamic> json) =>
      _$AddRecipeToFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$AddRecipeToFavoriteToJson(this);
}
