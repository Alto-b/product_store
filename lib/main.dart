import 'package:flutter/material.dart';
import 'package:product_store/application/product_bloc/fetch_bloc/fetch_bloc.dart';
import 'package:product_store/application/product_bloc/post_bloc/post_bloc.dart';
import 'package:product_store/domain/repository/product_repository.dart';
import 'package:product_store/presentation/screens/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(ProductsRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product Store',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          brightness: Brightness.dark
        ),
        home: const HomePage(),
                ),
    );
  }
}
