import 'package:dio/dio.dart';
import 'package:health_app/network/recipes_try.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: 'http://healthy-app.eu-4.evennode.com/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;
  @GET('recipes')
  Future<Recipes> getAllRecipes();
}
