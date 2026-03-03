import 'package:health_app/network/auth.dart';
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
}
