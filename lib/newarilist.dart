import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';


class NewariList extends StatelessWidget {
  final List<Recipe> newariRecipes = [
    Recipe(
      name: 'Yomari',
      description: 'A sweet steamed dumpling made from rice flour, filled with molasses and sesame seeds.',
      ingredients: ['Rice Flour', 'Molasses', 'Sesame Seeds'],
      image: 'assets/images/Yomari.jpg', 
    ),
    Recipe(
      name: 'Newari Khaja Set',
      description: 'A traditional platter of beaten rice served with various side dishes.',
      ingredients: ['Beaten Rice', 'Meat', 'Pickles', 'Eggs'],
      image: 'assets/images/Newari Khaja Set.jpg', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Newari Recipes')),
      body: ListView.builder(
        itemCount: newariRecipes.length,
        itemBuilder: (context, index) {
          final recipe = newariRecipes[index];
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
