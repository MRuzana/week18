class ProductsModel {
  String productTitle;
  String productImage;

  ProductsModel({required this.productTitle, required this.productImage});

  factory ProductsModel.fromJson (Map<String,dynamic> json){
    return ProductsModel(
      productTitle: json['title'], 
      productImage: json['image']
    );
  }
}
