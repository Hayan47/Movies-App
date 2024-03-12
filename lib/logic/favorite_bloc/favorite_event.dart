part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent extends Equatable {}

class GetFavoriteList extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class AddToFavorite extends FavoriteEvent {
  final Movie movie;

  AddToFavorite({required this.movie});
  @override
  List<Object> get props => [movie];
}

class RemoveFromFavorite extends FavoriteEvent {
  final Movie movie;

  RemoveFromFavorite({required this.movie});
  @override
  List<Object> get props => [movie];
}
