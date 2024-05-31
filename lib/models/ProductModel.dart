class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ratingModel rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(jsondata) {
    dynamic priceValue = jsondata['price'];
    double parsedPrice =
        priceValue is double ? priceValue : double.parse(priceValue.toString());
    return ProductsModel(
      id: jsondata['id'],
      title: jsondata['title'],
      price: parsedPrice,
      description: jsondata['description'],
      category: jsondata['category'],
      image: jsondata['image'],
      rating: ratingModel.fromJson(jsondata['rating']),
    );
  }
}

class ratingModel {
  final double rate;
  final int count;
  ratingModel({required this.count, required this.rate});
  factory ratingModel.fromJson(jsondata) {
    return ratingModel(
      count: jsondata['count'],
      rate: (jsondata['rate'] ?? 0.0).toDouble(),
    );
  }
}
