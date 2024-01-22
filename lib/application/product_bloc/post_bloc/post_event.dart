part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class AddEvent extends PostEvent{
  String title;
  String description;
  num price;
  String image;
  String category;

    AddEvent({
      required this.title,
      required  this.description,
      required this.price,
      required this.category,
      required this.image
    });

    @override
    List<Object> get props=> [title,description,price,category,image];

}
