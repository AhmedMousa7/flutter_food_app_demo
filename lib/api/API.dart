import 'dart:async';
import 'dart:convert';
import 'package:food_app/models/Meal.dart';
import 'package:food_app/models/MealDetails.dart';
import 'package:http/http.dart' as http;

class API {

  static Future<List<Meal>> getProducts() async {
   final response =
      await http.get('https://run.mocky.io/v3/e87e5228-618a-4fc1-a2fd-57e7e4e0d7f4');

       if (response.statusCode == 200) {
         Iterable list = json.decode(response.body);
         return list.map((model) => Meal.fromJson(model)).toList();
        } else {
        throw Exception('Failed to load Meals');
      }
  }

  static Future<MealDetails> getMealDetails() async{
     final response =
      await http.get('https://run.mocky.io/v3/3dc805af-0a8d-4103-834c-8ea738f17a33');

       if (response.statusCode == 200) {
         return MealDetails.fromJson(json.decode(response.body));
        } else {
        throw Exception('Failed to load Details');
      }
  }
}
