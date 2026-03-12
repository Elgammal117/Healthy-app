import 'package:health_app/network/Favo.dart';
import 'package:health_app/network/auth.dart';
import 'package:health_app/network/profile.dart';
import 'package:health_app/network/recipes_try.dart';
import 'package:health_app/network/web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<Recipes> getAllRecipes() async {
    var respons = await webServices.getAllRecipes();
    return respons;
  }

  Future<LoginRespons> login(LoginRequest request) async {
    var respons = await webServices.login(request);
    return respons;
  }

  Future<SignUpRespons> signUp(SignUpRequest request) async {
    var respons = await webServices.signUp(request);
    return respons;
  }

  Future<OtpRespons> confirmEmail(OtpRequest request) async {
    var respons = await webServices.confirmEmail(request);
    return respons;
  }

  Future<ForgetPassRespons> forgetPassword(ForgetPassRequest request) async {
    var respons = await webServices.forgetPassword(request);
    return respons;
  }

  Future<OtpVerifyrespons> otpVerify(OtpVerifyreq request) async {
    var respons = await webServices.OtpVerify(request);
    return respons;
  }

  Future<ResetPassRespons> resetPassword(ResetPassReq request) async {
    var respons = await webServices.resetPassword(request);
    return respons;
  }

  Future<Favo> getFavorites(String token) async {
    var respons = await webServices.getFavorites('Bearer $token');
    return respons;
  }

  Future<CreateProfileRespons> createProfile(
    String token,
    CreateProfileReqest request,
  ) async {
    var respons = await webServices.createProfile('Bearer $token', request);
    return respons;
  }

  Future<GetProfile> getProfile(String token) async {
    var respons = await webServices.getProfile('Bearer $token');
    return respons;
  }

  Future<AddRecipeToFavorite> addFavorite(String token, String foodId) async {
    var respons = await webServices.addFavorite('Bearer $token', foodId);
    return respons;
  }
}
