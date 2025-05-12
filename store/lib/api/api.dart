import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/models/products_model.dart';
class Api{

  static const products = 'https://fakestoreapi.com/products';

  Future<List<ProductsModel>>getProductList()async{
    final response = await http.get(Uri.parse(products));
    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body) as List;
      return decodedData.map((product) => ProductsModel.fromJson(product)).toList();
    }
    else{
      throw Exception('something happened');
    }
  }
}
