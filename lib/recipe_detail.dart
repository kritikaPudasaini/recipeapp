import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(recipe.image, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                recipe.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Description:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(recipe.description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(
                'Ingredients:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...recipe.ingredients.map((ingredient) => Text('- $ingredient', style: const TextStyle(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
