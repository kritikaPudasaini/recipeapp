import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';
import 'recipe_detail.dart';  

class ChineseList extends StatelessWidget {
  final List<Recipe> chineseRecipes = [
    Recipe(
      name: 'Fried Rice',
      description: 'A popular Chinese dish made with rice, veggies, and sauces.',
      ingredients: ['Rice', 'Soy Sauce', 'Vegetables', 'Eggs'],
      image: 'assets/Fried Rice.jpg',
    ),
    Recipe(
      name: 'Dumplings',
      description: 'Soft dumplings filled with meat or vegetables.',
      ingredients: ['Flour', 'Meat/Vegetables', 'Soy Sauce', 'Ginger'],
      image: 'assets/Dumplings.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chinese Recipes')),
      body: ListView.builder(
        itemCount: chineseRecipes.length,
        itemBuilder: (context, index) {
          final recipe = chineseRecipes[index];
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
