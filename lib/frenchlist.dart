import 'package:flutter/material.dart';
import 'model/recipemodel.dart';


class FrenchList extends StatelessWidget {
  final List<Recipe> frenchRecipes = [
    Recipe(
      name: 'Croissant',
      description: 'A buttery, flaky pastry that is a French breakfast staple.',
      ingredients: ['Flour', 'Butter', 'Yeast', 'Milk'],
      image: 'assets/images/Croissant.jpg', 
    ),
    Recipe(
      name: 'Ratatouille',
      description: 'A vegetable stew made with fresh ingredients.',
      ingredients: ['Zucchini', 'Eggplant', 'Tomatoes', 'Bell Peppers'],
      image: 'assets/images/Ratatouille.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('French Recipes')),
      body: ListView.builder(
        itemCount: frenchRecipes.length,
        itemBuilder: (context, index) {
          final recipe = frenchRecipes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(recipe.image, width: 50, height: 50, fit: BoxFit.cover), // Add image preview
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
                          Image.asset(recipe.image, width: double.infinity, fit: BoxFit.cover), // Full image in dialog
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
