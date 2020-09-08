import 'package:flutter/material.dart';
import '../../screens/Categories Meals/category_meals_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItemWidget({this.id, this.title, this.color});

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      print(id);
      return CategoryMealsScreen(
        categoryId: id,
        categoryTitle: title,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color, color.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
