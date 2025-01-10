
class Recipe {
  final String name;
  final String description;
  final List<String> ingredients;
  final String image; // New property for the recipe image

  Recipe({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.image, // Initialize the image property
  });
}

