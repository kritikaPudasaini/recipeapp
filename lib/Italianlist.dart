import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';
import 'recipe_detail.dart';  

class ItalianList extends StatelessWidget {
  final List<Recipe> italianRecipes = [
    Recipe(
      name: 'Pizza',
      description: 'A classic Italian dish with a crispy base and delicious toppings.',
      ingredients: ['Flour', 'Tomato Sauce', 'Cheese', 'Toppings'],
      image: 'assets/Pizza.jpg',
    ),
    Recipe(
      name: 'Pasta',
      description: 'A traditional Italian dish with rich and creamy sauces.',
      ingredients: ['Pasta', 'Olive Oil', 'Garlic', 'Parmesan Cheese'],
      image: 'assets/Pasta.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Italian Recipes')),
      body: ListView.builder(
        itemCount: italianRecipes.length,
        itemBuilder: (context, index) {
          final recipe = italianRecipes[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(recipe.description),
              onTap: () {
                // Navigate to RecipeDetail page
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
