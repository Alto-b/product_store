part of 'fetch_bloc.dart';

sealed class FetchEvent extends Equatable {
  const FetchEvent();

  @override
  List<Object> get props => [];
}

final class FetchLoadedEvent extends FetchEvent{
  
}