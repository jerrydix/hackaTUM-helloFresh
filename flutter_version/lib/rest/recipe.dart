
class Recipe {
  final String name;
  final String imagePath;
  final String abstract;
  final String description;
  final DateTime time;
  final List<String> ingredients;
  final List<String> steps;
  late String timeString;
  //final List<String> tags,

  Recipe({
    required this.name,
    required this.imagePath,
    required this.abstract,
    required this.description,
    required this.time,
    required this.ingredients,
    required this.steps,
    //required this.tags,
  }) {
    if (time.hour == 0) {
      timeString = '${time.minute} min';
    } else {
      timeString = '${time.hour}:${time.minute} h';
    }
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(name: 'Chicken Soup', imagePath: 'assets/Orange.png', abstract: 'This is a recipe for chicken soup', description: 'This is a recipe for chicken soup', time: DateTime.now(), ingredients: ['Chicken', 'Soup'], steps: ['Cook', 'Eat'],
      //name: json['label'] as String,
      //imagePath: json['image'] as String,
      );
  }
}