class Meal {
  int id;
  String name;
  String image;
  String complexity;
  String affordability;
  int time;

  Meal(int id, String name, String image, String complexity,
      String affordability, int time) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.complexity = complexity;
    this.affordability = affordability;
    this.time = time;
  }

  Meal.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        complexity = json['complexity'],
        time = json['time'],
        affordability = json['affordability'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'complexity': complexity,
      'time': time,
      'affordability': affordability
    };
  }
}
