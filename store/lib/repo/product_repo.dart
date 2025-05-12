

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'as http;
import 'package:store/models/products_model.dart';

class ProductRepo{


  static const _product = 'https://fakestoreapi.com/products';
  List<ProductsModel> product = [];

  Future<List<ProductsModel>>fetchProduct()async{

    try{
       final response = await http.get(Uri.parse(_product));

       final decodedData = jsonDecode(response.body) as List;
       for(int i=0;i<decodedData.length;i++){

        ProductsModel products =ProductsModel.fromJson(decodedData[i]);
        product.add(products);
       }
       return product;
       
    }
    catch(e){
      log(e.toString());
      return [];
    }
   

    


  }
}