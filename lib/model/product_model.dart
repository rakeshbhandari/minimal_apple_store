class ProductModel {
  final int pid;
  final String imgURl;
  final String title;
  final double price;
  final String shortDescription;
  final String longDescription;
  final int review;
  final double rating;
  bool isSelected;
  int qty;

  
  ProductModel({
    required this.pid,
    required this.imgURl,
    required this.title,
    required this.price,
    required this.shortDescription,
    required this.longDescription,
    required this.review,
    required this.rating,
     this.isSelected = false,
     this.qty=1,
  });

  ProductModel copyWith({
    int? pid,
    String? imgURl,
    String? title,
    double? price,
    String? shortDescription,
    String? longDescription,
    int? review,
    double? rating,
    bool? isSelected,
    int? qty,
  }) {
    return ProductModel(
      pid: pid ?? this.pid,
      imgURl: imgURl ?? this.imgURl,
      title: title ?? this.title,
      price: price ?? this.price,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      isSelected: isSelected ?? this.isSelected,
      qty: qty ?? this.qty,
    );
  }
}
