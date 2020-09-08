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
  _CategoryMealsScreenState createState() =>
      _CategoryMealsScreenState(categoryTitle: this.categoryTitle);
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  final String categoryTitle;

  _CategoryMealsScreenState({this.categoryTitle});

  Future<List<Meal>> _mealListFuture;

  initState() {
    super.initState();
    _mealListFuture = API.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: FutureBuilder<List<Meal>>(
            future: _mealListFuture,
            builder: (context, response) {
              if (response.hasData) {
                var meals = response.data;
                return ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    return MealItemWidget(
                      id: meals[index].id,
                      title: meals[index].name,
                      imageUrl: meals[index].image,
                      duration: meals[index].time,
                      complexity: meals[index].complexity.getComplexity(),
                      affordability:
                          meals[index].affordability.getAffordability(),
                    );
                  },
                );
              } else if (response.hasError) {
                return Text("${response.error}");
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}
