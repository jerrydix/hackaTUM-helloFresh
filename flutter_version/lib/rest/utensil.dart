class Utensil {
  final String name;

  Utensil({required this.name});

  factory Utensil.fromJson(Map<String, dynamic> json) {
    return Utensil(
        name: json['name'] as String,
    );
  }
}