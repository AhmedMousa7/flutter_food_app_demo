class MealDetails {
  String imageUrl;
  List<dynamic> ingredients;
  List<dynamic> steps;

  MealDetails(String imageUrl, List<dynamic> ingredients, List<dynamic> steps) {
    this.imageUrl = imageUrl;
    this.ingredients = ingredients;
    this.steps = steps;
  }

  MealDetails.fromJson(Map json)
      : imageUrl = json['imageUrl'],
        ingredients = json['ingredients'],
        steps = json['steps'];

  Map toJson() {
    return {
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps
    };
  }

}