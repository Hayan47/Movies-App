part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MoviesLoading extends MovieState {}

final class MoviesLoaded extends MovieState {
  final List<Movie> movies;

  MoviesLoaded({required this.movies});
}

final class MoviesError extends MovieState {
  final String message;

  MoviesError({required this.message});
}
