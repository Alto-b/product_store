import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_store/domain/repository/product_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  ProductsRepo rep;
  PostBloc(this.rep) : super(PostInitial()) {
    on<AddEvent>((event, emit) {
      rep.addProduct(event.title, event.description, event.category, event.image, event.price);
    });
  }
}
