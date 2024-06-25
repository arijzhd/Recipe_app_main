class Favorite {
  final String title;
  final List<String> ingredients;
  final String recipe;

  Favorite(
      {required this.title, required this.ingredients, required this.recipe});

  factory Favorite.fromMap(Map<String, dynamic> data) {
    return Favorite(
      title: data['title'],
      ingredients: List<String>.from(data['ingredients']),
      recipe: data['recipe'],
    );
  }
}
