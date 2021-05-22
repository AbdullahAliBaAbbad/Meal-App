import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/cateogry_meals_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detailed_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import './screens/categories_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoritesMeals = [];

  void toggleFavorite(String mealId){
    final existingIndex = favoritesMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >=0) {
      setState(() {
        favoritesMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorite(String id) {
    return favoritesMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  color: Color.fromRGBO(20,30,50, 1)
              ),
              body2: TextStyle(
                  color: Color.fromRGBO(20,30,50, 1)
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold
              )
          )
      ),
      // home: CategoriesSreen(),
      routes: {
        '/' : (context) => TabScreen(favoritesMeals),
        CategoryMealsScreen.routName: (context)=> CategoryMealsScreen(),
        MealDetailedScreen.routeName: (context)=> MealDetailedScreen(toggleFavorite,isFavorite),
        FilterScreen.routeName: (context) => FilterScreen()
      },
    );
  }
}

