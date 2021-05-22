import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filterScreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget buildSwitchTile(
      String title, String descritpion, bool value, Function onTheChange) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(descritpion),
        value: value,
        onChanged: onTheChange);
  }

  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "Adjust your meal sections!",
              style: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile(
                    "Gluten-Free", "View only Gluten-free meals", isGlutenFree,
                    (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),

                buildSwitchTile(
                    "Lactose-Free", "View only Lactose-Free meals", isLactoseFree,
                        (newValue) {
                      setState(() {
                        isLactoseFree = newValue;
                      });
                    }),

                buildSwitchTile(
                    "Vegetarian", "View only vegetarian meals", isVegetarian,
                        (newValue) {
                      setState(() {
                        isVegetarian = newValue;
                      });
                    }),

                buildSwitchTile(
                    "Vegan", "View only vegan meals", isVegan,
                        (newValue) {
                      setState(() {
                        isVegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
