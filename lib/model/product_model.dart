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
}
