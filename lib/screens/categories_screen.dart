import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/categories_items.dart';

class CategoriesSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData) =>
        (
        CategoriesItems(catData.id,catData.title,catData.color)

        )).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      ),
    );
  }
}
