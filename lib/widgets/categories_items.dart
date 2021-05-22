import 'package:flutter/material.dart';
import 'package:meal_app/screens/cateogry_meals_screen.dart';

class CategoriesItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoriesItems(this.id, this.title, this.color);


  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routName,
    arguments: {
      "id" : id,
      "title" : title
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ]
          ),
          borderRadius: BorderRadius.circular(15)
        ),

      ),
    );
  }
}
