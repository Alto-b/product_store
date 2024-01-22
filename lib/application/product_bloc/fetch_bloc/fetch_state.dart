part of 'fetch_bloc.dart';

sealed class FetchState extends Equatable {
  const FetchState();
  
  @override
  List<Object> get props => [];
}

final class FetchLoadingState extends FetchState {
  @override
  List<Object> get props => [];
}

final class FetchLoadedState extends FetchState{
  List<ProductsModel> productList = [];
  FetchLoadedState(this.productList);

  @override
  List<Object> get props => [];
}

final class FetchErrorState extends FetchState{
  String? error;
  FetchErrorState({this.error});

  @override
  List<Object> get props => [];
}