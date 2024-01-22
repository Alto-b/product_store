import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_store/application/product_bloc/fetch_bloc/fetch_bloc.dart';
import 'package:product_store/application/product_bloc/post_bloc/post_bloc.dart';
import 'package:product_store/domain/model/product_model.dart';
import 'package:product_store/domain/repository/product_repository.dart';
import 'package:product_store/presentation/screens/add_page.dart';
import 'package:product_store/presentation/widgets/appbar.dart';
import 'package:product_store/presentation/widgets/product_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => FetchBloc(ProductsRepo())..add(FetchLoadedEvent()),
    
        ),
            BlocProvider(
                create: (context) => PostBloc(ProductsRepo()),
            ),
        ],
              child: Scaffold(
              appBar: PreferredSize( preferredSize: Size(150, 80),child: HomePageAppBar(screenHeight: screenHeight)),
        
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                  
                      BlocBuilder<FetchBloc, FetchState>(
                        builder: (context, state) {
                          print(state);
                          if(state is FetchLoadingState){
                            return const Center(child: CircularProgressIndicator());
                          }
                          else if(state is FetchLoadedState){
                            List<ProductsModel> list = state.productList;
                            return HomePageContainer(screenHeight, screenWidth,list);
                            
                          }
                          else{
                            return Container(child: Icon(Icons.error),);
                          }
                          
                        },
                      )
                    ],
                  ),
                ),
              ),
    
              floatingActionButton: FloatingActionButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage(screenHeight: screenHeight),));
              },
                mini: true,
                backgroundColor: Colors.black87,
                splashColor: Colors.grey,
                child: const Icon(Icons.add,size: 30,fill: 1,color: Colors.white,),),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              
            ),
    );

    
  }


  
}

