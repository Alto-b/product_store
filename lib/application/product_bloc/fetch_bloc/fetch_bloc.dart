import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_store/domain/model/product_model.dart';
import 'package:product_store/domain/repository/product_repository.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  ProductsRepo rep;
  FetchBloc(this.rep) : super(FetchLoadingState()) {
    on<FetchLoadedEvent>((event, emit) async{
      
      emit(FetchLoadingState());
      try{
        final prod = await rep.getAllProducts();
        print("{ products : $prod}");
        emit(FetchLoadedState(prod));
      }
      catch(e){
        emit(FetchErrorState(error: "$e"));
      }
    });
  }
}
