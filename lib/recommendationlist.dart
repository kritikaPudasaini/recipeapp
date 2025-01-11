import 'package:flutter/material.dart';
import 'package:recipe_app_789/model/recipemodel.dart';
import 'recipe_detail.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recommendations = [
      Recipe(
        name: 'Pizza Margherita',
        image: 'assets/PIZZA-MARGHERITA.jpg',
        description: 'A classic Italian pizza with fresh tomatoes, mozzarella, and basil.',
        ingredients: [
          'Pizza dough',
          'Tomato sauce',
          'Mozzarella cheese',
          'Fresh basil',
          'Olive oil',
          'Salt'
        ],
      ),
      Recipe(
        name: 'Kung Pao Chicken',
        image: 'assets/Kung Pao Chicken.jpg',
        description: 'A spicy Chinese stir-fry with chicken, peanuts, and vegetables.',
        ingredients: [
          'Chicken breast',
          'Dried red chilies',
          'Peanuts',
          'Soy sauce',
          'Garlic',
          'Ginger',
          'Vegetables (bell peppers, carrots, etc.)',
          'Cornstarch',
          'Sesame oil'
        ],
      ),
      Recipe(
        name: 'French Croissant',
        image: 'assets/French Croissant.jpg',
        description: 'A buttery, flaky pastry that is a French breakfast staple.',
        ingredients: [
          'Flour',
          'Butter',
          'Milk',
          'Sugar',
          'Yeast',
          'Salt',
          'Eggs'
        ],
      ),
      Recipe(
        name: 'Newari Bara',
        image: 'assets/Newari Bara.jpg',
        description: 'A traditional lentil pancake from Newari cuisine.',
        ingredients: [
          'Black lentils (urad dal)',
          'Ginger',
          'Garlic',
          'Green chilies',
          'Cumin powder',
          'Salt',
          'Oil for frying'
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SizedBox(
          height: 250, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final recipe = recommendations[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetail(recipe: recipe),
                    ),
                  );
                },
                child: SizedBox(
                  width: 150, 
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            recipe.image,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipe.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
