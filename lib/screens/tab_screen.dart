import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favoriate_screen.dart';

class TabScreen extends StatefulWidget {


  final List<Meal> favoriteMeals;

   TabScreen( this.favoriteMeals);


  @override
  _TabScreenState createState() => _TabScreenState();
}



class _TabScreenState extends State<TabScreen> {
  List<Map<String,Object>> _pages;
  @override
  void initState() {

    _pages = [
      {
        'page' : CategoriesSreen(),
        'title' : 'Categories',
      },
      {
        'page' : FaviorateScreen(widget.favoriteMeals),
        'title' :'Your Favorites',
      }
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favorite")
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
