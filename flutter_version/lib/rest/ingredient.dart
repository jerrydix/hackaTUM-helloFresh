class Ingredient {
  final String type;
  final String quantity;
  final String unit;
  final double price;

  Ingredient({
    required this.type,
    required this.quantity,
    required this.unit,
    required this.price,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      type: json['name'],
      quantity: json['quantity'],
      unit: json['unit'],
      price: json['price'],
    );
  }
}