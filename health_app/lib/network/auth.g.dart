// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  email: json['email'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

LoginRespons _$LoginResponsFromJson(Map<String, dynamic> json) => LoginRespons(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginResponsToJson(LoginRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  email: json['email'] as String?,
  userName: json['userName'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'userName': instance.userName,
};

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
    };

SignUpRespons _$SignUpResponsFromJson(Map<String, dynamic> json) =>
    SignUpRespons(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SignUpResponsToJson(SignUpRespons instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'userId': instance.userId,
      'email': instance.email,
    };

OtpRequest _$OtpRequestFromJson(Map<String, dynamic> json) =>
    OtpRequest(email: json['email'] as String?, otp: json['otp'] as String?);

Map<String, dynamic> _$OtpRequestToJson(OtpRequest instance) =>
    <String, dynamic>{'email': instance.email, 'otp': instance.otp};

OtpRespons _$OtpResponsFromJson(Map<String, dynamic> json) => OtpRespons(
  success: json['success'] as bool?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$OtpResponsToJson(OtpRespons instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

ForgetPassRequest _$ForgetPassRequestFromJson(Map<String, dynamic> json) =>
    ForgetPassRequest(email: json['email'] as String?);

Map<String, dynamic> _$ForgetPassRequestToJson(ForgetPassRequest instance) =>
    <String, dynamic>{'email': instance.email};

ForgetPassRespons _$ForgetPassResponsFromJson(Map<String, dynamic> json) =>
    ForgetPassRespons(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ForgetPassResponsToJson(ForgetPassRespons instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

OtpVerifyreq _$OtpVerifyreqFromJson(Map<String, dynamic> json) =>
    OtpVerifyreq(email: json['email'] as String?, otp: json['otp'] as String?);

Map<String, dynamic> _$OtpVerifyreqToJson(OtpVerifyreq instance) =>
    <String, dynamic>{'email': instance.email, 'otp': instance.otp};

OtpVerifyrespons _$OtpVerifyresponsFromJson(Map<String, dynamic> json) =>
    OtpVerifyrespons(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OtpVerifyresponsToJson(OtpVerifyrespons instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

ResetPassReq _$ResetPassReqFromJson(Map<String, dynamic> json) => ResetPassReq(
  email: json['email'] as String?,
  newPassword: json['newPassword'] as String?,
);

Map<String, dynamic> _$ResetPassReqToJson(ResetPassReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
    };

ResetPassRespons _$ResetPassResponsFromJson(Map<String, dynamic> json) =>
    ResetPassRespons(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResetPassResponsToJson(ResetPassRespons instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

CreateProfileReqest _$CreateProfileReqestFromJson(Map<String, dynamic> json) =>
    CreateProfileReqest(
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      activityLevel: json['activityLevel'] as String?,
      goal: json['goal'] as String?,
      targetLoseKg: (json['targetLoseKg'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateProfileReqestToJson(
  CreateProfileReqest instance,
) => <String, dynamic>{
  'height': instance.height,
  'weight': instance.weight,
  'age': instance.age,
  'gender': instance.gender,
  'activityLevel': instance.activityLevel,
  'goal': instance.goal,
  'targetLoseKg': instance.targetLoseKg,
};

CreateProfileRespons _$CreateProfileResponsFromJson(
  Map<String, dynamic> json,
) => CreateProfileRespons(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
  estimatedWeightChange: json['estimatedWeightChange'] == null
      ? null
      : EstimatedWeightChange.fromJson(
          json['estimatedWeightChange'] as Map<String, dynamic>,
        ),
  weightProgress: (json['weightProgress'] as List<dynamic>?)
      ?.map((e) => WeightProgress.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateProfileResponsToJson(
  CreateProfileRespons instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data?.toJson(),
  'estimatedWeightChange': instance.estimatedWeightChange?.toJson(),
  'weightProgress': instance.weightProgress?.map((e) => e.toJson()).toList(),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  macros: json['macros'] == null
      ? null
      : Macros.fromJson(json['macros'] as Map<String, dynamic>),
  sId: json['sId'] as String?,
  userId: json['userId'] as String?,
  iV: (json['iV'] as num?)?.toInt(),
  activityLevel: json['activityLevel'] as String?,
  age: (json['age'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  dailyCalories: (json['dailyCalories'] as num?)?.toInt(),
  gender: json['gender'] as String?,
  goal: json['goal'] as String?,
  height: (json['height'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'macros': instance.macros?.toJson(),
  'sId': instance.sId,
  'userId': instance.userId,
  'iV': instance.iV,
  'activityLevel': instance.activityLevel,
  'age': instance.age,
  'createdAt': instance.createdAt,
  'dailyCalories': instance.dailyCalories,
  'gender': instance.gender,
  'goal': instance.goal,
  'height': instance.height,
  'updatedAt': instance.updatedAt,
  'weight': instance.weight,
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

EstimatedWeightChange _$EstimatedWeightChangeFromJson(
  Map<String, dynamic> json,
) => EstimatedWeightChange(
  days: (json['days'] as num?)?.toInt(),
  weeks: (json['weeks'] as num?)?.toInt(),
  months: (json['months'] as num?)?.toInt(),
);

Map<String, dynamic> _$EstimatedWeightChangeToJson(
  EstimatedWeightChange instance,
) => <String, dynamic>{
  'days': instance.days,
  'weeks': instance.weeks,
  'months': instance.months,
};

WeightProgress _$WeightProgressFromJson(Map<String, dynamic> json) =>
    WeightProgress(
      week: (json['week'] as num?)?.toInt(),
      expectedWeight: (json['expectedWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeightProgressToJson(WeightProgress instance) =>
    <String, dynamic>{
      'week': instance.week,
      'expectedWeight': instance.expectedWeight,
    };
