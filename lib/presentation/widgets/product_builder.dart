  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_store/domain/model/product_model.dart';

Container HomePageContainer(double screenHeight, double screenWidth,List<ProductsModel> list) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
      ),
            height: screenHeight-125,
            width: screenWidth-10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: list.length,
            
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage('${list[index].image}',),fit: BoxFit.fill),
                        ),            
                        child:  Card(
                          color: Colors.white10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text("${list[index].title}",style: titleStyle(),)
                              ListTile(
                                tileColor: Colors.white,
                              title: Text("${list[index].title}",style: titleStyle().copyWith(fontSize: 12),overflow: TextOverflow.ellipsis,),

                              subtitle: Text("\$ ${list[index].price}",style: const TextStyle(color: Colors.grey),),
                              )
                            ],
                          ),
                        ),
                    ),
                  );
                }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing: 3,mainAxisSpacing: 3),
                ),
            ),
          );

          
  }
  
TextStyle titleStyle() => GoogleFonts.aBeeZee(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700);