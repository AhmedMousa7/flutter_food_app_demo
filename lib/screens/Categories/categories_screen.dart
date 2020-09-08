import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';
import '../../widgets/Categories/category_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: DUMMY_CATEGORIES.length,
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      itemBuilder: (buildCtx, index) {
        return CategoryItemWidget(
          id: DUMMY_CATEGORIES[index].id,
          title: DUMMY_CATEGORIES[index].title,
          color: DUMMY_CATEGORIES[index].color,
        );
      },
    );
  }
}
