import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';


class ChineseList extends StatelessWidget {
  final List<Recipe> chineseRecipes = [
    Recipe(
      name: 'Fried Rice',
      description: 'A popular Chinese dish made with rice, veggies, and sauces.',
      ingredients: ['Rice', 'Soy Sauce', 'Vegetables', 'Eggs'],
      image: 'assets/images/Fried Rice.jpg', 
    ),
    Recipe(
      name: 'Dumplings',
      description: 'Soft dumplings filled with meat or vegetables.',
      ingredients: ['Flour', 'Meat/Vegetables', 'Soy Sauce', 'Ginger'],
      image: 'assets/images/Dumplings.jpg', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chinese Recipes')),
      body: ListView.builder(
        itemCount: chineseRecipes.length,
        itemBuilder: (context, index) {
          final recipe = chineseRecipes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(recipe.description),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(recipe.name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(recipe.image, width: double.infinity, fit: BoxFit.cover), 
                          SizedBox(height: 10),
                          Text('Description: ${recipe.description}'),
                          SizedBox(height: 10),
                          Text('Ingredients:'),
                          ...recipe.ingredients.map((ingredient) => Text('- $ingredient')).toList(),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
