part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsEvent {}

class GetMovieDetails extends MovieDetailsEvent {
  final int movieID;

  GetMovieDetails({required this.movieID});
}
