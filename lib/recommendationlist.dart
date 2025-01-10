import 'package:flutter/material.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> recommendations = [
      {
        'name': 'Pizza Margherita',
        'image': 'assets/images/Pizza_Margherita.jpg',
        'recipe': 'A classic Italian pizza with fresh tomatoes, mozzarella, and basil.',
      },
      {
        'name': 'French Croissant',
        'image': 'assets/images/ French croissant.jpg',
        'recipe': 'A buttery, flaky pastry that is a French breakfast staple.',
      },
      {
        'name': 'Kung Pao Chicken',
        'image': 'assets/images/Kung Pao Chicken.jpg',
        'recipe': 'A spicy Chinese stir-fry with chicken, peanuts, and vegetables.',
      },
      {
        'name': 'Newari Bara',
        'image': 'assets/images/Newari Bara.jpg',
        'recipe': 'A traditional lentil pancake from Newari cuisine.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Single column for all items
            childAspectRatio: 4 / 2, // Adjust for image and text
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Show recipe details when an image is clicked
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(recommendations[index]['name']!),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            recommendations[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 16),
                          Text(recommendations[index]['recipe']!),
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
              child: Card(
                elevation: 3,
                child: Row(
                  children: [
                    Image.asset(
                      recommendations[index]['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        recommendations[index]['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

