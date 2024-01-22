import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_store/domain/model/product_model.dart';
import 'package:product_store/infrastructure/api/api.dart';

class ProductsRepo{

  // Future<List<ProductsModel>> getAllProducts()async{
  //   final response = await http.get(Uri.parse(productBaseURL));
  //   final List data = jsonDecode(response.body);
  //   print("status code : ${response.statusCode}");
    
  //   if(response.statusCode == 200){
  //   //  print("data : ${data}");
  //     List<ProductsModel> list = data.map((e) => ProductsModel.fromJson(e)).toList();
  //     print(list);
  //     return list;
      
  //   }
  //   else{
  //     throw Exception("error fetching data");
  //   }

  // }


///////////////////////////////////////////////////////////////////////////
 Future<List<ProductsModel>> getAllProducts() async{
    try{
      final url = productBaseURL;
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if(response.statusCode == 200){
        print("fetch success ${response.statusCode}");
        print(response.body);
        List json = jsonDecode(response.body) ;
        List <ProductsModel> list =json.map((e) => ProductsModel.fromJson(e)).toList();
        return list;
        
      }
    }
    catch(e){
      print("exceptions occured in fetching data: $e");
    }
    throw Exception("failed to fetch data");
  }
//////////////////////////////////////////////////////////
    
    Future<void> addProduct(String title,String description,num price,String category,String image)async{
      final body={
        "title":title,
        "price":price,
        "description":description,
        "category":category,
        "image":image
      };
      final url = productBaseURL;
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {
          'Content-Type':'appliation/json'
        }
      );
      if(response.statusCode == 201 || response.statusCode == 200){
        print(response.statusCode);
        print(response.body);
      }
      else{ 
        print("post failed");
      }
    }


}