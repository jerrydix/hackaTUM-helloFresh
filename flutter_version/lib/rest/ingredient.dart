class Ingredient {
  final int id;
  final String type;
  final int quantity;
  final String unit;
  final String price;

  Ingredient({
    required this.id,
    required this.type,
    required this.quantity,
    required this.unit,
    required this.price,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] as int,
      type: json['ingredientType'] as String,
      quantity: json['quantity'] as int,
      unit: json['unit'] as String,
      price: json['price'] as String,
    );
  }
}