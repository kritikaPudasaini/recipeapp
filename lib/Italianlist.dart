import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';

class ItalianList extends StatelessWidget {
  final List<Recipe> italianRecipes = [
    Recipe(
      name: 'Pizza',
      description: 'A classic Italian dish with a crispy base and delicious toppings.',
      ingredients: ['Flour', 'Tomato Sauce', 'Cheese', 'Toppings'],
      image: 'assets/images/Pizza.jpg', 
    ),
    Recipe(
      name: 'Pasta',
      description: 'A traditional Italian dish with rich and creamy sauces.',
      ingredients: ['Pasta', 'Olive Oil', 'Garlic', 'Parmesan Cheese'],
      image: 'assets/images/Pasta.jpg', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Italian Recipes')),
      body: ListView.builder(
        itemCount: italianRecipes.length,
        itemBuilder: (context, index) {
          final recipe = italianRecipes[index];
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

