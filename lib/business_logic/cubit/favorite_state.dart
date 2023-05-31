part of 'favorite_cubit.dart';

class FavoriteState {}

class FavoritesInitial extends FavoriteState {}

class FavoritesUpdated extends FavoriteState {
  final List<int> favorites;

  FavoritesUpdated(this.favorites);
}
