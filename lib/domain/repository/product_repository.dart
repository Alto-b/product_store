import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_store/domain/model/product_model.dart';
import 'package:product_store/infrastructure/api/api.dart';

class ProductsRepo{

  Future<List<ProductsModel>> getAllProducts()async{
    final response = await http.get(Uri.parse(productBaseURL));
    final List data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return data.map((e) => ProductsModel.fromJson(e)).toList();
    }
    else{
      throw Exception("error fetching data");
    }

  }
}