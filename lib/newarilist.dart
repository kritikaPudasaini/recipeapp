import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';
import 'recipe_detail.dart'; 

class NewariList extends StatelessWidget {
  final List<Recipe> newariRecipes = [
    Recipe(
      name: 'Yomari',
      description: 'A sweet steamed dumpling made from rice flour, filled with molasses and sesame seeds.',
      ingredients: ['Rice Flour', 'Molasses', 'Sesame Seeds'],
      image: 'assets/Yomari.jpg',
    ),
    Recipe(
      name: 'Newari Khaja Set',
      description: 'A traditional platter of beaten rice served with various side dishes.',
      ingredients: ['Beaten Rice', 'Meat', 'Pickles', 'Eggs'],
      image: 'assets/Newari Khaja Set.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Newari Recipes')),
      body: ListView.builder(
        itemCount: newariRecipes.length,
        itemBuilder: (context, index) {
          final recipe = newariRecipes[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(recipe.description),
              onTap: () {
                // Navigate to the RecipeDetail page
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
