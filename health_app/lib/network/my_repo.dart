import 'package:health_app/network/recipes_try.dart';
import 'package:health_app/network/web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<Recipes> getAllRecipes() async {
    var respons = await webServices.getAllRecipes();
    return respons;
  }
}
