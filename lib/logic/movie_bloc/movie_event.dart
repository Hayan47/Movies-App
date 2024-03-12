part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class GetPopularMovies extends MovieEvent {
  final int pageNumber;

  GetPopularMovies({required this.pageNumber});
}
