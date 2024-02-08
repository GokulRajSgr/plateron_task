class Salad {
  final String dishName;
  final String description;
  final double price;
  final String imagePath;
  int selectedItems; // New property

  Salad({
    required this.dishName,
    required this.description,
    required this.price,
    required this.imagePath,
    this.selectedItems = 0, // Default to 0
  });
}
