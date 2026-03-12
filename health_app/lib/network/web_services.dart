import 'package:dio/dio.dart';
import 'package:health_app/network/profile.dart';
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

  @POST('profile/upsert')
  Future<CreateProfileRespons> createProfile(
    @Header('Authorization') String authHeader,
    @Body() CreateProfileReqest request,
  );
  @GET('profile/me')
  Future<GetProfile> getProfile(@Header('Authorization') String authHeader);

  @POST('favorites/{foodId}')
  Future<AddRecipeToFavorite> addFavorite(
    @Header('Authorization') String authHeader,
    @Path("foodId") String foodId,
  );
}
