import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginRespons {
  bool? success;
  String? message;
  String? token;
  User? user;

  LoginRespons({this.success, this.message, this.token, this.user});

  factory LoginRespons.fromJson(Map<String, dynamic> json) =>
      _$LoginResponsFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  String? email;
  String? userName;

  User({this.id, this.email, this.userName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUpRequest {
  String? userName;
  String? email;
  String? password;
  String? phone;

  SignUpRequest({this.userName, this.email, this.password, this.phone});

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUpRespons {
  bool? success;
  String? message;
  String? userId;
  String? email;

  SignUpRespons({this.success, this.message, this.userId, this.email});

  factory SignUpRespons.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponsFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OtpRequest {
  String? email;
  String? otp;

  OtpRequest({this.email, this.otp});

  factory OtpRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OtpRespons {
  bool? success;
  String? message;

  OtpRespons({this.success, this.message});

  factory OtpRespons.fromJson(Map<String, dynamic> json) =>
      _$OtpResponsFromJson(json);
  Map<String, dynamic> toJson() => _$OtpResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ForgetPassRequest {
  String? email;

  ForgetPassRequest({this.email});

  factory ForgetPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetPassRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ForgetPassRespons {
  bool? success;
  String? message;

  ForgetPassRespons({this.success, this.message});

  factory ForgetPassRespons.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassResponsFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetPassResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OtpVerifyreq {
  String? email;
  String? otp;

  OtpVerifyreq({this.email, this.otp});

  factory OtpVerifyreq.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyreqFromJson(json);
  Map<String, dynamic> toJson() => _$OtpVerifyreqToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OtpVerifyrespons {
  bool? success;
  String? message;

  OtpVerifyrespons({this.success, this.message});

  factory OtpVerifyrespons.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyresponsFromJson(json);
  Map<String, dynamic> toJson() => _$OtpVerifyresponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResetPassReq {
  String? email;
  String? newPassword;

  ResetPassReq({this.email, this.newPassword});

  factory ResetPassReq.fromJson(Map<String, dynamic> json) =>
      _$ResetPassReqFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPassReqToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResetPassRespons {
  bool? success;
  String? message;

  ResetPassRespons({this.success, this.message});

  factory ResetPassRespons.fromJson(Map<String, dynamic> json) =>
      _$ResetPassResponsFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPassResponsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateProfileReqest {
  int? height;
  int? weight;
  int? age;
  String? gender;
  String? activityLevel;
  String? goal;
  int? targetGainKg;

  CreateProfileReqest({
    this.height,
    this.weight,
    this.age,
    this.gender,
    this.activityLevel,
    this.goal,
    this.targetGainKg,
  });

  factory CreateProfileReqest.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileReqestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateProfileReqestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateProfileRespons {
  bool? success;
  Data? data;
  EstimatedWeightChange? estimatedWeightChange;
  List<WeightProgress>? weightProgress;

  CreateProfileRespons({
    this.success,
    this.data,
    this.estimatedWeightChange,
    this.weightProgress,
  });

  factory CreateProfileRespons.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileResponsFromJson(json);
  Map<String, dynamic> toJson() => _$CreateProfileResponsToJson(this);
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

@JsonSerializable(explicitToJson: true)
class EstimatedWeightChange {
  int? days;
  int? weeks;
  int? months;

  EstimatedWeightChange({this.days, this.weeks, this.months});

  factory EstimatedWeightChange.fromJson(Map<String, dynamic> json) =>
      _$EstimatedWeightChangeFromJson(json);
  Map<String, dynamic> toJson() => _$EstimatedWeightChangeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WeightProgress {
  int? week;
  double? expectedWeight;

  WeightProgress({this.week, this.expectedWeight});

  factory WeightProgress.fromJson(Map<String, dynamic> json) =>
      _$WeightProgressFromJson(json);
  Map<String, dynamic> toJson() => _$WeightProgressToJson(this);
}
