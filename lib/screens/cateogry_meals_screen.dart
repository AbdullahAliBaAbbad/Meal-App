import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = "category_meals";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute
        .of(context)
        .settings
        .arguments as Map;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imageUrl: categoryMeal[index].imageUrl,
              duration: categoryMeal[index].duration,
              complexity: categoryMeal[index].complexity,
              affordability: categoryMeal[index].affordability);
          },
          itemCount: categoryMeal.length
      ),
    );
  }
}
