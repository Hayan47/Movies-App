part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class GetSearchedMovies extends SearchEvent {
  final String query;

  GetSearchedMovies({required this.query});
}
