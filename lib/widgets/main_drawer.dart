import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildListTile(String title,IconData iconData,Function tapHandler){
      return ListTile(
        leading: Icon(iconData),
        title: Text(title),
        onTap: tapHandler,
      );
    }
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              alignment: Alignment.center,
              child: Text("Cooking Up!",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),),
            ),
           SizedBox(height: 10,),
           buildListTile("Meals", Icons.restaurant, (){Navigator.of(context).pushNamed('/');}),
            buildListTile("Filters", Icons.filter_alt_sharp, (){Navigator.of(context).pushNamed(FilterScreen.routeName);}),

          ],
        ),
      ),
    );
  }
}
