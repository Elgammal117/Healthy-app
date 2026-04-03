import 'package:dio/dio.dart';
import 'package:health_app/network/AddMeal.dart';
import 'package:health_app/network/DailyStatus.dart';
import 'package:health_app/network/Getmealbydate.dart';
import 'package:health_app/network/profile.dart';
import 'package:health_app/network/recipes_try.dart';
import 'package:health_app/network/auth.dart';
import 'package:retrofit/retrofit.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: 'https://healthy-app-production.up.railway.app/')
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
  Future<Recipes> getFavorites(@Header('Authorization') String authHeader);

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
  @GET('recipes/{foodId}')
  Future<RecipeById> getrecipebyid(@Path("foodId") String foodId);
  @POST('meals/add')
  Future<AddMealRespons> addMeal(
    @Header('Authorization') String authHeader,
    @Body() AddMealRequest request,
  );

  @GET('/meals/status?date={date}')
  Future<DailyStatusRespons> getdailystatus(
    @Header('Authorization') String authHeader,
    @Path("date") String date,
  );

  @GET('/meals/?date={date}')
  Future<GetMealByDateRespons> getmealsbydate(
    @Header('Authorization') String authHeader,
    @Path("date") String date,
  );
}
