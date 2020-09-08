import 'package:flutter/material.dart';
import '../../api/API.dart';
import '../../models/Meal.dart';
import '../../widgets/Categories Meals/meal_item_widget.dart';
import '../../models/Categories.dart';
import 'dart:convert';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState(categoryTitle: this.categoryTitle);
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  final String categoryTitle;

  _CategoryMealsScreenState({this.categoryTitle});

  var meals = new List<Meal>();

  _getMeals() {
    API.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        meals = list.map((model) => Meal.fromJson(model)).toList();
      });
    }).catchError((error) {
      print(error);
    });
  }

  initState() {
    super.initState();
    _getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItemWidget(
            id: meals[index].id,
            title: meals[index].name,
            imageUrl: meals[index].image,
            duration: meals[index].time,
            complexity: meals[index].complexity.getComplexity(),
            affordability: meals[index].affordability.getAffordability(),
          );
        },
      ),
    );
  }
}
