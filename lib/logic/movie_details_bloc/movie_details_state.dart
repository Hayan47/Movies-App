part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails movie;

  MovieDetailsLoaded({required this.movie});
}

final class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError({required this.message});
}
