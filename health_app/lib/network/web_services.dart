import 'package:dio/dio.dart';
import 'package:health_app/network/Favo.dart';
import 'package:health_app/network/recipes_try.dart';
import 'package:health_app/network/auth.dart';
import 'package:retrofit/retrofit.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: 'http://healthy-app.eu-4.evennode.com/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET('recipes')
  Future<Recipes> getAllRecipes();

  @POST('auth/login')
  Future<LoginRespons> login(@Body() LoginRequest request);

  @POST('auth/signup')
  Future<SignUpRespons> signUp(@Body() SignUpRequest request);

  @POST('auth/confirm-email')
  Future<OtpRespons> confirmEmail(@Body() OtpRequest request);

  @POST('auth/forget-password')
  Future<ForgetPassRespons> forgetPassword(@Body() ForgetPassRequest request);
  @POST('auth/verify-otp')
  Future<OtpVerifyrespons> OtpVerify(@Body() OtpVerifyreq request);

  @POST('auth/reset-password')
  Future<ResetPassRespons> resetPassword(@Body() ResetPassReq request);
  @GET('favorites')
  Future<Favo> getFavorites(@Header('Authorization') String authHeader);
}
