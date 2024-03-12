part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState extends Equatable {}

final class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

final class FavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteUpdated extends FavoriteState {
  final List<Movie> favorites;

  FavoriteUpdated(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
  @override
  List<Object> get props => [message];
}
