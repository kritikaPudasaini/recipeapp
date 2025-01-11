import 'package:flutter/material.dart';
import 'model/recipemodel.dart';
import 'recipe_detail.dart'; 

class FrenchList extends StatelessWidget {
  final List<Recipe> frenchRecipes = [
    Recipe(
      name: 'Croissant',
      description: 'A buttery, flaky pastry that is a French breakfast staple.',
      ingredients: ['Flour', 'Butter', 'Yeast', 'Milk'],
      image: 'assets/Croissant.jpg',
    ),
    Recipe(
      name: 'Ratatouille',
      description: 'A vegetable stew made with fresh ingredients.',
      ingredients: ['Zucchini', 'Eggplant', 'Tomatoes', 'Bell Peppers'],
      image: 'assets/Ratatouille.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('French Recipes')),
      body: ListView.builder(
        itemCount: frenchRecipes.length,
        itemBuilder: (context, index) {
          final recipe = frenchRecipes[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(recipe.description),
              onTap: () {
               
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetail(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
