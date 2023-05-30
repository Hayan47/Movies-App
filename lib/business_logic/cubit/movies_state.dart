part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> characters;

  MoviesLoaded(this.characters);
}

// class QuotesLoaded extends MoviesState {
//   final List<Quote> quotes;

//   QuotesLoaded(this.quotes);
// }