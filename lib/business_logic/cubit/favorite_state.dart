part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {
  final List<String> favoriteMovies = [];
}

class FavoriteInitial extends FavoriteState {}
