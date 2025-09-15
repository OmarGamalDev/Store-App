class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RattingModel ratting;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratting,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title']?.toString() ?? "",
      price: (jsonData['price'] is int)
          ? (jsonData['price'] as int).toDouble()
          : (jsonData['price'] is double)
          ? jsonData['price']
          : 0.0,
      description: jsonData['description']?.toString() ?? "",
      category: jsonData['category']?.toString() ?? "",
      image: jsonData['image']?.toString() ?? "",
      ratting: jsonData['rating'] != null
          ? RattingModel.fromJson(jsonData['rating'])
          : RattingModel(rate: 0.0, count: 0),
    );
  }
}

class RattingModel {
  final double rate;
  final int count;
  RattingModel({required this.rate, required this.count});
factory RattingModel.fromJson(jsonData) {
  return RattingModel(
    rate: (jsonData['rate'] is int)
        ? (jsonData['rate'] as int).toDouble()
        : (jsonData['rate'] is double)
            ? jsonData['rate']
            : 0.0,
    count: jsonData['count'] ?? 0,
  );
}

}
