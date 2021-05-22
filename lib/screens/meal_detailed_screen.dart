import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailedScreen extends StatelessWidget {
  static const routeName = 'meal_details';
  final Function toggleFunction;
  final Function isFavorite;

  const MealDetailedScreen(this.toggleFunction, this.isFavorite);

  Widget buildTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments as String;
    final mealContent = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealContent.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealContent.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(mealContent.ingredients[index]),
                  ),
                ),
                itemCount: mealContent.ingredients.length,
              ),
            ),
            buildTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(mealContent.steps[index]),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
                itemCount: mealContent.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            toggleFunction(mealId);
          },
          child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border,
          )),
    );
  }
}
